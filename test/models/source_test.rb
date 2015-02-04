require 'test_helper'

class SourceTest < Minitest::Test
  describe SourceTest do
    it "must validate properly" do
      source = Fabricate(:source)
      source.valid?.must_equal true
      source.household.wont_be_nil

      Fabricate(:source, household: nil).valid?.must_equal false
    end
  end
end
