require 'test_helper'

class InvestmentTest < Minitest::Test
  describe InvestmentTest do
    it "should be valid" do
      Fabricate.build(:investment).valid?.must_equal true
    end
  end
end
