
admin = User.create(name: 'Admin', password: 'portfolioz', password_confirmation: 'portfolioz',
  email: 'admin@portfolioz.co', role: :admin)

household = Household.create(name: "Smith")
household.members.build(name: 'Investor', password: 'portfolioz', password_confirmation: 'portfolioz', role: :user)

brokerage = Brokerage.create(name: "TD Ameritrade", household: household)

account = Account.create(name: "Smith IRA", brokerage: brokerage)

investment = Investment.create(name: "IBM")

holding = Holding.create(investment: investment, account: account, shares: 0.0)

deposit = Deposit.create(amount: 11000.0, account: account)
withdrawal = Withdrawal.create(amount: 1000.0, account: account)
buy = Buy.create(shares: 100, price: 35.763, commission: 7.00, account: account, investment: investment, holding: holding)
sell = Sell.create(shares: 90, price: 15.763, commission: 7.00, account: account, investment: investment, holding: holding)



