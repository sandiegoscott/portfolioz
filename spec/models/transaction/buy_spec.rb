require 'spec_helper'

describe Buy do

  it "should compute attributes properly" do

    buy = FactoryGirl.create(:buy, shares: 29.0, price: 5.0, commission: 5.00)
    expect(buy.cash_delta).to eq(-150.00)
    expect(buy.shares_delta).to eq(29.0)

  end

end
