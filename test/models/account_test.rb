require 'test_helper'

class AccountTest < Minitest::Test
  describe AccountTest do

    it "must validate properly" do
      account = Fabricate(:account)
      account.valid?.must_equal true
      account.brokerage.wont_be_nil

      Fabricate(:account, brokerage: nil).valid?.must_equal false
    end

    it "should calculate cash correctly" do
      account = Fabricate(:account, brokerage: nil)
      Fabricate(:deposit, amount: 11000.0, account: account, investment: nil, holding: nil)
      Fabricate(:withdrawal, amount: 1000.0, account: account, investment: nil, holding: nil)
      Fabricate(:buy, shares: 100, price: 35.763, commission: 7.00, account: account, investment: nil, holding: nil)
      Fabricate(:sell, shares: 100, price: 15.763, commission: 7.00, account: account, investment: nil, holding: nil)
      account.cash.must_equal 7986.00
    end
  end

end
