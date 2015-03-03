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
      holding = Fabricate.create(:holding)
      investment = holding.investment
      account = holding.account
      Fabricate.create(:buy, shares: 100.0, price: 35.763, commission: 7.00, holding: holding, investment: investment, account: account)
      Fabricate.create(:sell, shares: 34.0, price: 15.763, commission: 7.00, holding: holding, investment: investment, account: account)
      holding.shares.must_equal 66.0
    end

  end
end
