require 'test_helper'

class InvestmentTest < ActiveSupport::TestCase

  it "must be valid" do
    Fabricate.build(:investment).valid?.must_equal true
  end

end
