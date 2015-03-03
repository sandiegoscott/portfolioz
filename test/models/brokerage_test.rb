require 'test_helper'

class BrokerageTest < Minitest::Test
  describe BrokerageTest do
    it "must validate properly" do
      brokerage = Fabricate.build(:brokerage)
      brokerage.valid?.must_equal true
      brokerage.household.wont_be_nil

      Fabricate.create(:brokerage, household: nil).valid?.must_equal false
    end

    it "must calculate cash correctly" do
      holding = Fabricate.create(:holding)
      investment = holding.investment
      account = holding.account
      brokerage = account.brokerage
      Fabricate.create(:deposit, amount: 11000.0, account: account)
      Fabricate.create(:withdrawal, amount: 1000.0, account: account)
      Fabricate.create(:buy, shares: 100, price: 35.763, commission: 7.00, account: account, investment: investment, holding: holding)
      Fabricate.create(:sell, shares: 90, price: 15.763, commission: 7.00, account: account, investment: investment, holding: holding)
      brokerage.cash.must_equal 7828.37
      holding.shares.must_equal 10.0
    end
  end
end
