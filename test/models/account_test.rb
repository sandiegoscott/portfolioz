require 'test_helper'

class AccountTest < Minitest::Test
  describe AccountTest do

    it "should validate properly" do
      account = Fabricate.build(:account)
      account.valid?.must_equal true
      account.brokerage.wont_be_nil

      Fabricate.create(:account, brokerage: nil).valid?.must_equal false
    end

    it "should calculate cash correctly" do
      holding = Fabricate.create(:holding)
      investment = holding.investment
      account = holding.account
      brokerage = account.brokerage
      Fabricate.create(:deposit, amount: 11000.0, account: account)
      Fabricate.create(:withdrawal, amount: 1000.0, account: account)
      Fabricate.create(:buy, shares: 100, price: 35.763, commission: 7.00, account: account, investment: investment, holding: holding)
      Fabricate.create(:sell, shares: 90, price: 15.763, commission: 7.00, account: account, investment: investment, holding: holding)
      account.cash.must_equal 7828.37
    end
  end

end
