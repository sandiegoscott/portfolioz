require 'test_helper'

class CoverTest < Minitest::Test
  describe CoverTest do

    it "must validate properly" do

      cover = Fabricate.create(:cover)
      cover.valid?.must_equal true
      cover.account.wont_be_nil
      cover.investment.wont_be_nil
      cover.holding.wont_be_nil

      cover = Fabricate.build(:cover, account: nil)
      cover.valid?.must_equal false

      cover = Fabricate.build(:cover, investment: nil)
      cover.valid?.must_equal false

      cover = Fabricate.build(:cover, holding: nil)
      cover.valid?.must_equal false

    end

    it "compute attributes properly" do

      cover = Fabricate.create(:cover, shares: 29.0, price: 5.0, commission: 5.00)
      cover.cash_delta.must_equal -150.00
      cover.shares_delta.must_equal 29.0

    end
  end
end
