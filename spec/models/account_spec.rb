require 'spec_helper'

describe Account do

  it "should calculate cash correctly" do
    account = FactoryGirl.create(:account, brokerage: nil)
    FactoryGirl.create(:deposit, amount: 11000.0, account: account, investment: nil, holding: nil)
    FactoryGirl.create(:withdrawal, amount: 1000.0, account: account, investment: nil, holding: nil)
    FactoryGirl.create(:buy, shares: 100, price: 35.763, commission: 7.00, account: account, investment: nil, holding: nil)
    FactoryGirl.create(:sell, shares: 100, price: 15.763, commission: 7.00, account: account, investment: nil, holding: nil)
    expect(account.cash).to eq(7986.00)
  end

end
