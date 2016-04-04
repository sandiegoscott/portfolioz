require 'rails_helper'

describe Expense do

  it "should compute attributes properly" do

    expense = FactoryGirl.create(:expense, amount: 150.0, date_str: "2014-10-31")
    expect(expense.ddate).to eq(Date.new(2014,10,31))
    expect(expense.cash_delta).to eq(-150.0)

  end

end
