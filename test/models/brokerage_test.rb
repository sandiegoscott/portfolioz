require 'test_helper'

class BrokerageTest < ActiveSupport::TestCase
  describe BrokerageTest do
    it "must be valid" do
      Fabricate(:brokerage).valid?.must_equal true
      Fabricate.build(:brokerage, name: '').valid?.must_equal false
      Fabricate.build(:brokerage, household: nil).valid?.must_equal false
    end

    it "should calculate cash correctly" do
      brokerage = Fabricate(:brokerage)
      account1 = Fabricate(:account, brokerage: brokerage, cash: 80.00)
      account2 = Fabricate(:account, brokerage: brokerage, cash: 77.77)
      brokerage.cash.must_equal 157.77
    end
  end
end
