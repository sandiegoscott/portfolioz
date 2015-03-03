require 'test_helper'

class SellTest < Minitest::Test
  describe SellTest do

    it "must validate properly" do

      sell = Fabricate.create(:sell)
      sell.valid?.must_equal true
      sell.account.wont_be_nil
      sell.investment.wont_be_nil
      sell.holding.wont_be_nil

      sell = Fabricate.build(:sell, account: nil)
      sell.valid?.must_equal false

      sell = Fabricate.build(:sell, investment: nil)
      sell.valid?.must_equal false

      sell = Fabricate.build(:sell, holding: nil)
      sell.valid?.must_equal false

    end

    it "compute attributes properly" do

      sell = Fabricate.create(:sell, shares: 29.0, price: 5.0, commission: 5.00)
      sell.cash_delta.must_equal 140.00
      sell.shares_delta.must_equal -29.0

    end
  end
end
