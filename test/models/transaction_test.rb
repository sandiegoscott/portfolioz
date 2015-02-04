require 'test_helper'
#require 'minitest/spec'
#require 'minitest/autorun'

class TransactionTest < Minitest::Test
  describe TransactionTest do

    # enum kind: [:deposit, :withdrawal, :expense, :interest, :dividend, :buy, :cover, :sell, :short]
    it "must validate properly" do

      deposit = Fabricate(:deposit)
      deposit.valid?.must_equal true
      deposit.account.wont_be_nil

      Fabricate(:deposit, account: nil).valid?.must_equal false

      Fabricate(:dividend, account: nil).investment.wont_be_nil

      buy = Fabricate(:buy)
      buy.valid?.must_equal true
      buy.account.wont_be_nil
      buy.investment.wont_be_nil
      buy.holding.wont_be_nil

      Fabricate(:buy, account: nil).valid?.must_equal false
      Fabricate(:buy, investment: nil).valid?.must_equal false
      Fabricate(:buy, holding: nil).valid?.must_equal false

    end

    it "compute attributes properly" do

      deposit = Fabricate(:deposit, amount: 150.0, date_str: "2014-10-31")
      deposit.ddate.must_equal Date.new(2014,10,31)
      deposit.cash_delta.must_equal 150.0

      withdrawal = Fabricate(:withdrawal, amount: 150.0, account: nil)
      withdrawal.cash_delta.must_equal -150.0

      expense = Fabricate(:expense, amount: 150.0, account: nil)
      expense.cash_delta.must_equal -150.0

      interest = Fabricate(:interest, amount: 150.0, account: nil)
      interest.cash_delta.must_equal 150.0

      dividend = Fabricate(:dividend, amount: 150.0, account: nil)
      dividend.investment.wont_be_nil
      dividend.cash_delta.must_equal 150.0

      buy = Fabricate(:buy, shares: 29.0, price: 5.0, commission: 5.00)
      buy.cash_delta.must_equal -150.00
      buy.shares_delta.must_equal 29.0

      cover = Fabricate(:cover, shares: 29.0, price: 5.0, commission: 5.00, account: nil, investment: nil, holding: nil)
      cover.cash_delta.must_equal -150.00
      cover.shares_delta.must_equal 29.0

      sell = Fabricate(:sell, amount: 150.0, shares: 31.0, price: 5.0, commission: 5.00, account: nil, investment: nil, holding: nil)
      sell.cash_delta.must_equal 150.00
      sell.shares_delta.must_equal BigDecimal.new("-31.0")

      short = Fabricate(:short, amount: 150.0, shares: 31.0, price: 5.0, commission: 5.00, account: nil, investment: nil, holding: nil)
      short.cash_delta.must_equal 150.00
      short.shares_delta.must_equal BigDecimal.new("-31.0")

    end
  end
end
