require 'spec_helper'

describe Deposit do

  it "must compute attributes properly" do

    deposit = FactoryGirl.create(:deposit, amount: 160.0, date_str: "2014-10-31")
    expect(deposit.ddate).to eq(Date.new(2014,10,31))
    expect(deposit.cash_delta).to eq(160.0)

  end

end
