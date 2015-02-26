require 'spec_helper'

describe Holding do

  it "should calculate shares correctly" do
    holding = FactoryGirl.create(:holding, account: nil)
    FactoryGirl.create(:deposit, amount: 11000.0, account: nil, investment: nil, holding: holding)
    FactoryGirl.create(:withdrawal, amount: 1000.0, account: nil, investment: nil, holding: holding)
    FactoryGirl.create(:buy, shares: 100.0, price: 35.763, commission: 7.00, account: nil, investment: nil, holding: holding)
    FactoryGirl.create(:sell, shares: 34.0, price: 15.763, commission: 7.00, account: nil, investment: nil, holding: holding)
    expect(holding.shares).to eq(66.00)
  end

end
