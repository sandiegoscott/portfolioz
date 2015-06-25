require 'spec_helper'

describe Interest do

  it "should compute attributes properly" do

    interest = FactoryGirl.create(:interest, amount: 150.0, date_str: "2014-10-31")
    expect(interest.ddate).to eq(Date.new(2014,10,31))
    expect(interest.cash_delta).to eq(150.0)

  end

end
