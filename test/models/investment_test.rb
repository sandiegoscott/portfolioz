require 'test_helper'

class InvestmentTest < Minitest::Test
  describe InvestmentTest do
    it "must be valid" do
      Fabricate(:investment).valid?.must_equal true
    end
  end
end
