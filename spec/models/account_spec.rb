require 'spec_helper'

describe Account do

  it "should calculate cash correctly" do
    holding = FactoryGirl.create(:holding)
    investment = holding.investment
    account = holding.account
    brokerage = account.brokerage
    FactoryGirl.create(:deposit, amount: 11000.0, account: account)
    FactoryGirl.create(:withdrawal, amount: 1000.0, account: account)
    FactoryGirl.create(:buy, shares: 100, price: 35.763, commission: 7.00, account: account, investment: investment, holding: holding)
    FactoryGirl.create(:sell, shares: 90, price: 15.763, commission: 7.00, account: account, investment: investment, holding: holding)
    expect(account.cash).to eq(7828.37)
  end

end
