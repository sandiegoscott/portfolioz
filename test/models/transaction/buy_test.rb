require 'test_helper'

class BuyTest < Minitest::Test
  describe BuyTest do

    it "must validate properly" do

      buy = Fabricate.create(:buy)
      buy.valid?.must_equal true
      buy.account.wont_be_nil
      buy.investment.wont_be_nil
      buy.holding.wont_be_nil

      buy = Fabricate.build(:buy, account: nil)
      buy.valid?.must_equal false

      buy = Fabricate.build(:buy, investment: nil)
      buy.valid?.must_equal false

      buy = Fabricate.build(:buy, holding: nil)
      buy.valid?.must_equal false

    end

    it "compute attributes properly" do

      buy = Fabricate.create(:buy, shares: 29.0, price: 5.0, commission: 5.00)
      buy.cash_delta.must_equal -150.00
      buy.shares_delta.must_equal 29.0

    end
  end
end
