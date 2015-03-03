require 'spec_helper'

describe Brokerage do

  it "is invalid without a name" do
    brokerage = FactoryGirl.build(:brokerage, name: nil)
    brokerage.valid?
    expect(brokerage.errors[:name]).to include("can't be blank")
  end

end