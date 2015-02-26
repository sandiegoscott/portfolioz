require 'spec_helper'

describe Transaction do

  it "should calculate attributes correctly" do

    deposit = FactoryGirl.create(:deposit, amount: 150.0, date_str: "2014-10-31")
    expect(deposit.ddate).to eq(Date.new(2014,10,31))
    expect(deposit.cash_delta).to eq(150.0)

    withdrawal = FactoryGirl.create(:withdrawal, amount: 150.0, account: nil)
    expect(withdrawal.cash_delta).to eq(-150.0)

    expense = FactoryGirl.create(:expense, amount: 150.0, account: nil)
    expect(expense.cash_delta).to eq(-150.0)

    interest = FactoryGirl.create(:interest, amount: 150.0, account: nil)
    expect(interest.cash_delta).to eq(150.0)

    dividend = FactoryGirl.create(:dividend, amount: 150.0, account: nil)
    #dividend.investment.wont_be_nil
    expect(dividend.cash_delta).to eq(150.0)

    buy = FactoryGirl.create(:buy, shares: 29.0, price: 5.0, commission: 5.00)
    expect(buy.cash_delta).to eq(-150.00)
    expect(buy.shares_delta).to eq(29.0)

    cover = FactoryGirl.create(:cover, shares: 29.0, price: 5.0, commission: 5.00, account: nil, investment: nil, holding: nil)
    expect(cover.cash_delta).to eq(-150.00)
    expect(cover.shares_delta).to eq(29.0)

    sell = FactoryGirl.create(:sell, amount: 150.0, shares: 31.0, price: 5.0, commission: 5.00, account: nil, investment: nil, holding: nil)
    expect(sell.cash_delta).to eq(150.00)
    expect(sell.shares_delta).to eq(BigDecimal.new("-31.0"))

    short = FactoryGirl.create(:short, amount: 150.0, shares: 31.0, price: 5.0, commission: 5.00, account: nil, investment: nil, holding: nil)
    expect(short.cash_delta).to eq(150.00)
    expect(short.shares_delta).to eq(BigDecimal.new("-31.0"))

  end
end
