require 'test_helper'

class ExpenseTest < Minitest::Test
  describe ExpenseTest do

    it "must validate properly" do

      expense = Fabricate.create(:expense)
      expense.valid?.must_equal true
      expense.account.wont_be_nil

      expense = Fabricate.build(:expense, account: nil)
      expense.valid?.must_equal false

    end

    it "must compute attributes properly" do

      expense = Fabricate.create(:expense, amount: 150.0, date_str: "2014-10-31")
      expense.ddate.must_equal Date.new(2014,10,31)
      expense.cash_delta.must_equal -150.0

    end
  end
end
