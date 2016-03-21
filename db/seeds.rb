  puts "===== (seeds.rb) ====="

if User.where(email: 'admin@portfolioz.com').empty?

  puts "===== Adding seeds ====="

  admin = User.create(name: 'Admin', password: 'portfolioz', password_confirmation: 'portfolioz',
    email: 'admin@portfolioz.co', role: :admin)

  household = Household.create(name: "Smith")
  household.members.build(name: 'Investor', password: 'portfolioz', password_confirmation: 'portfolioz', role: :user)

  brokerage = Brokerage.create(name: "TD Ameritrade", household: household)

  account = Account.create(name: "Smith IRA", brokerage: brokerage)

  investment = Investment.create(name: "IBM")

  holding = Holding.create(investment: investment, account: account, shares: 0.0)

  # create transactions
  deposit = Deposit.create(amount: 11000.00, account: account)

  withdrawal = Withdrawal.create(amount: 1000.0, account: account)
  buy = Buy.create(shares: 100, price: 35.763, commission: 7.00, account: account, investment: investment, holding: holding)
  sell = Sell.create(shares: 90, price: 15.763, commission: 7.00, account: account, investment: investment, holding: holding)

  # update transactions
  deposit.update_attributes(amount: 10000.00)
  withdrawal.update_attributes(amount: 900.00)
  buy.update_attributes(shares: 200, commission: 5.00)
  sell.update_attributes(shares: 80.0, commission: 6.00)

end
