require 'test_helper'

class SourceTest < Minitest::Test
  describe SourceTest do
    it "should validate properly" do
      source = Fabricate.build(:source)
      source.valid?.must_equal true
      source.household.wont_be_nil

      Fabricate.create(:source, household: nil).valid?.must_equal false
    end
  end
end
