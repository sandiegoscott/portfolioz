require 'spec_helper'

describe Household do

  it "has a valid factory" do
    expect(FactoryGirl.build(:household)).to be_valid
  end  

  it "is invalid without a name" do
    household = FactoryGirl.build(:household, name: nil)
    household.valid?
    expect(household.errors[:name]).to include("can't be blank")
  end

end
