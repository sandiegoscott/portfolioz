require 'test_helper'
#require 'minitest/spec'
#require 'minitest/autorun'

class TransactionTest < Minitest::Test
  describe TransactionTest do
    it "must validate properly" do
      Fabricate(:deposit).valid?.must_equal true
      Fabricate(:withdrawal).valid?.must_equal true
      Fabricate(:expense).valid?.must_equal true
      Fabricate(:dividend).valid?.must_equal true
      Fabricate(:interest).valid?.must_equal true
      Fabricate(:buy).valid?.must_equal true
      Fabricate(:cover).valid?.must_equal true
      Fabricate(:sell).valid?.must_equal true
      Fabricate(:short).valid?.must_equal true

      #Fabricate.build(:transaction, shares: nil).valid?.must_equal false
      #Fabricate.build(:transaction, price: nil).valid?.must_equal false
    end
  end
end

=begin
  it "should have a cash_change consistent with price, shares, and commission" do
    buy = Fabricate(:transaction, shares: 100, price: 35.763, commission: 7.00)
    buy.cash_change.must_equal -3583.30
  end
=end
