require 'spec_helper'

describe Withdrawal do

  it "must compute attributes properly" do

    withdrawal = FactoryGirl.create(:withdrawal, amount: 160.0, date_str: "2014-10-31")
    expect(withdrawal.ddate).to eq(Date.new(2014,10,31))
    expect(withdrawal.cash_delta).to eq(-160.0)

  end

end
