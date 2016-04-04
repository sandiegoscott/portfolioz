require 'rails_helper'

describe Sell do

  it "should compute attributes properly" do

    sell = FactoryGirl.create(:sell, shares: 31.0, price: 5.0, commission: 5.00)
    expect(sell.cash_delta).to eq(150.00)
    expect(sell.shares_delta).to eq(-31.0)

  end

end

