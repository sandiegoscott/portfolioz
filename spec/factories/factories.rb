FactoryGirl.define do

  factory :user do 
    name "Joe User"
    role :admin
    email "joe@user.com"
    password "password"
  end

  factory :investment do 
    name "IBM"
  end

  factory :source do 
    household
    name "IBM"
  end

  factory :recommendation do 
    investment
    source
  end

  factory :household do 
    name "Smith"
  end

  factory :brokerage do 
    household
    name "TD Ameritrade"
  end

  factory :account  do 
    brokerage
    name "Smith IRA"
  end

  factory :holding do 
    investment
    account
    shares 100.0
  end

  factory :split do 
    investment
    shares_before 1.0
    shares_after 1.0
  end

  factory :transaction do 
    account
  end

  factory :deposit, parent: :transaction do 
    kind :deposit
    amount 100.00
  end

  factory :withdrawal, parent: :transaction do 
    kind :withdrawal
    amount 100.00
  end

  factory :expense, parent: :transaction do 
    kind :expense
    amount 100.00
  end

  factory :dividend, parent: :transaction do 
    investment
    kind :dividend
    amount 100.00
  end

  factory :interest, parent: :transaction do 
    kind :interest
    amount 100.00
  end

  factory :buy, parent: :transaction do 
    investment
    holding
    kind :buy
    shares 75.0
    price 100.00
  end

  factory :cover, parent: :transaction do 
    investment
    account
    holding
    kind :cover
    shares 75.0
    price 100.00
  end

  factory :sell, parent: :transaction do 
    kind :sell
    investment
    account
    holding
    shares 31.00000
    price 5.00
    commission 5.00
  end

  factory :short, parent: :transaction do 
    kind :short
    investment
    account
    holding
    shares 75.0
    price 100.00
  end

end
