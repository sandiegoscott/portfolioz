require 'test_helper'

class SplitTest < Minitest::Test
  describe SplitTest do
    it "should validate properly" do
      split = Fabricate.build(:split)
      split.valid?.must_equal true
      split.investment.wont_be_nil

      Fabricate.create(:split, investment: nil).valid?.must_equal false
    end
  end
end
