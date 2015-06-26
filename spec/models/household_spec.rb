require 'rails_helper'

describe Household do

  it "should be invalid without a name" do
    household = FactoryGirl.build(:household, name: nil)
    household.valid?
    expect(household.errors[:name]).to include("can't be blank")
  end

end
