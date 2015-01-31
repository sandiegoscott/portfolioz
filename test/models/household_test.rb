require 'test_helper'

class HouseholdTest < Minitest::Test
  describe HouseholdTest do
    it "must validate properly" do
      Fabricate.build(:household).valid?.must_equal true  # can use build because doesn't belong to anything
      Fabricate.build(:household, name: '').valid?.must_equal false
    end
  end

end
