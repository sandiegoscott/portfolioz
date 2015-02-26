require 'test_helper'

class HoldingTest < Minitest::Test
  describe HoldingTest do

    it "must validate properly" do
      holding = Fabricate.build(:holding)
      holding.valid?.must_equal true
      holding.account.wont_be_nil
      holding.investment.wont_be_nil

      Fabricate.create(:holding, account: nil).valid?.must_equal false
      Fabricate.create(:holding, investment: nil).valid?.must_equal false
    end

    it "should calculate shares correctly" do
      holding = Fabricate.build(:holding, account: nil)
      Fabricate.create(:deposit, amount: 11000.0, account: nil, investment: nil, holding: holding)
      Fabricate.create(:withdrawal, amount: 1000.0, account: nil, investment: nil, holding: holding)
      Fabricate.create(:buy, shares: 100.0, price: 35.763, commission: 7.00, account: nil, investment: nil, holding: holding)
      Fabricate.create(:sell, shares: 34.0, price: 15.763, commission: 7.00, account: nil, investment: nil, holding: holding)
      holding.shares.must_equal 66.0
    end

  end
end
