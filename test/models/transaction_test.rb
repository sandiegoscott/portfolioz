require 'test_helper'
#require 'minitest/spec'
require 'minitest/autorun'

class TransactionTest < Minitest::Test
  describe TransactionTest do
    it "must validate properly" do
      #Fabricate(:transaction, kind: :deposit).valid?.must_equal false
      Fabricate(:transaction, kind: :deposit, amount: 100.00).valid?.must_equal true
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
