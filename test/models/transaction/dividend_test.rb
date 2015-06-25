require 'test_helper'

class DividendTest < Minitest::Test
  describe DividendTest do

    it "should validate properly" do

      dividend = Fabricate.create(:dividend)
      dividend.valid?.must_equal true
      dividend.account.wont_be_nil
      dividend.investment.wont_be_nil

      dividend = Fabricate.build(:dividend, account: nil)
      dividend.valid?.must_equal false

      dividend = Fabricate.build(:dividend, investment: nil)
      dividend.valid?.must_equal false

    end

    it "should compute attributes properly" do

      dividend = Fabricate.create(:dividend, amount: 150.0, date_str: "2014-10-31")
      dividend.ddate.must_equal Date.new(2014,10,31)
      dividend.cash_delta.must_equal 150.0

    end
  end
end
