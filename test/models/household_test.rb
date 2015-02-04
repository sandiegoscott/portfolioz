require 'test_helper'

class HouseholdTest < Minitest::Test
  describe HouseholdTest do
    it "must validate properly" do
      Fabricate(:household).valid?.must_equal true
    end
  end

end
