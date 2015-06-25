require 'test_helper'

class ShortTest < Minitest::Test
  describe ShortTest do

    it "should validate properly" do

      short = Fabricate.create(:short)
      short.valid?.must_equal true
      short.account.wont_be_nil
      short.investment.wont_be_nil
      short.holding.wont_be_nil

      short = Fabricate.build(:short, account: nil)
      short.valid?.must_equal false

      short = Fabricate.build(:short, investment: nil)
      short.valid?.must_equal false

      short = Fabricate.build(:short, holding: nil)
      short.valid?.must_equal false

    end

    it "should compute attributes properly" do

      short = Fabricate.create(:short, shares: 29.0, price: 5.0, commission: 5.00)
      short.cash_delta.must_equal 140.00
      short.shares_delta.must_equal -29.0

    end
  end
end
