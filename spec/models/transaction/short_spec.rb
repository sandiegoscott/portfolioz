require 'rails_helper'

describe Short do

  it "should compute attributes properly" do

    short = FactoryGirl.create(:short, shares: 31.0, price: 5.0, commission: 5.00)
    expect(short.cash_delta).to eq(150.00)
    expect(short.shares_delta).to eq(-31.0)

  end

end
