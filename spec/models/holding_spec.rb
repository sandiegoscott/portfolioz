require 'spec_helper'

describe Holding do

  it "should calculate shares correctly" do
    holding = FactoryGirl.create(:holding)
    investment = holding.investment
    account = holding.account
    FactoryGirl.create(:buy, shares: 100.0, price: 35.763, commission: 7.00, holding: holding, investment: investment, account: account)
    FactoryGirl.create(:sell, shares: 34.0, price: 15.763, commission: 7.00, holding: holding, investment: investment, account: account)
    expect(holding.shares).to eq(66.00)
  end

end
