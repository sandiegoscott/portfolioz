require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  describe AccountTest do
    it "must be valid" do
      Fabricate(:account).valid?.must_equal true
      Fabricate.build(:account, name: '').valid?.must_equal false
      Fabricate.build(:account, brokerage: nil).valid?.must_equal false
    end

    it "should calculate cash correctly" do
      holding = Fabricate(:holding)
      account = holding.account
      investment = holding.investment
      #deposit = Fabricate(:transaction, kind: :deposit, amount: 5000.00,
      #                      investment: investment, account: account, holding: holding)
      buy     = Fabricate(:transaction, kind: :buy, shares: 100, price: 35.763, commission: 7.00,
                            investment: investment, account: account, holding: holding)
      #sell    = Fabricate(:transaction, kind: :sell, shares: 10, price: 31.123, commission: 7.00,
      #                      investment: investment, account: account, holding: holding)
      account.cash.must_equal 1720.93
    end
  end
end
