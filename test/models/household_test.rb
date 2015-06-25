require 'test_helper'

class HouseholdTest < Minitest::Test
  describe HouseholdTest do

    it "should validate properly" do
      Fabricate.build(:household).valid?.must_equal true
    end

    it "is invalid without a name" do
      Fabricate.build(:household, name: nil).valid?.must_equal false
    end

  end

end
