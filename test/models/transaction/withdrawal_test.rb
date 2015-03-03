require 'test_helper'

class WithdrawalTest < Minitest::Test
  describe WithdrawalTest do

    it "must validate properly" do

      withdrawal = Fabricate.create(:withdrawal)
      withdrawal.valid?.must_equal true
      withdrawal.account.wont_be_nil

      withdrawal = Fabricate.build(:withdrawal, account: nil)
      withdrawal.valid?.must_equal false

    end

    it "must compute attributes properly" do

      withdrawal = Fabricate.create(:withdrawal, amount: 150.0, date_str: "2014-10-31")
      withdrawal.ddate.must_equal Date.new(2014,10,31)
      withdrawal.cash_delta.must_equal -150.0

    end
  end
end
