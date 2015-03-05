require 'test_helper'

class InterestTest < Minitest::Test
  describe InterestTest do

    it "must validate properly" do

      interest = Fabricate.create(:interest)
      interest.valid?.must_equal true
      interest.account.wont_be_nil

      interest = Fabricate.build(:interest, account: nil)
      interest.valid?.must_equal false

    end

    it "must compute attributes properly" do

      interest = Fabricate.create(:interest, amount: 150.0, date_str: "2014-10-31")
      interest.ddate.must_equal Date.new(2014,10,31)
      interest.cash_delta.must_equal 150.0

    end
  end
end
