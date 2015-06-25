require 'test_helper'

class DepositTest < Minitest::Test
  describe DepositTest do

    it "shouldv validate properly" do

      deposit = Fabricate.create(:deposit)
      deposit.valid?.must_equal true
      deposit.account.wont_be_nil

      deposit = Fabricate.build(:deposit, account: nil)
      deposit.valid?.must_equal false

    end

    it "should compute attributes properly" do

      deposit = Fabricate.create(:deposit, amount: 150.0, date_str: "2014-10-31")
      deposit.ddate.must_equal Date.new(2014,10,31)
      deposit.cash_delta.must_equal 150.0

    end
  end
end
