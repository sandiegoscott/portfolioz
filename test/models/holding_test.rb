require 'test_helper'

class HoldingTest < Minitest::Test
  describe HoldingTest do

    it "must validate properly" do
      holding = Fabricate(:holding)
      holding.valid?.must_equal true
      holding.account.wont_be_nil
      holding.investment.wont_be_nil

      Fabricate(:holding, account: nil).valid?.must_equal false
      Fabricate(:holding, investment: nil).valid?.must_equal false
    end

    it "should calculate shares correctly" do
      holding = Fabricate(:holding, account: nil)
      Fabricate(:deposit, amount: 11000.0, account: nil, investment: nil, holding: holding)
      Fabricate(:withdrawal, amount: 1000.0, account: nil, investment: nil, holding: holding)
      Fabricate(:buy, shares: 100.0, price: 35.763, commission: 7.00, account: nil, investment: nil, holding: holding)
      Fabricate(:sell, shares: 34.0, price: 15.763, commission: 7.00, account: nil, investment: nil, holding: holding)
      holding.shares.must_equal 66.0
    end

  end
end
