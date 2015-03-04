require 'spec_helper'

describe Transaction::Cover do

  it "compute attributes properly" do

    cover = FactoryGirl.create(:cover, shares: 29.0, price: 5.0, commission: 5.00)
    expect(cover.cash_delta).to eq(-150.00)
    expect(cover.shares_delta).to eq(29.0)

  end

end
