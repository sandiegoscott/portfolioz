require 'test_helper'

class SplitTest < Minitest::Test
  describe SplitTest do
    it "must validate properly" do
      split = Fabricate(:split)
      split.valid?.must_equal true
      split.investment.wont_be_nil

      Fabricate(:split, investment: nil).valid?.must_equal false
    end
  end
end
