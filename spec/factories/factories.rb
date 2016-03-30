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

  factory :deposit do
    account
    amount 100.00
  end

  factory :withdrawal do 
    account
    amount 100.00
  end

  factory :expense do 
    account
    amount 100.00
  end

  factory :dividend do 
    investment
    account
    amount 100.00
  end

  factory :interest do 
    account
    amount 100.00
  end

  factory :buy do 
    investment
    account
    holding
    shares 75.0
    price 100.00
    commission 5.00
  end

  factory :cover do
    investment
    account
    holding
    shares 75.0
    price 100.00
  end

  factory :sell do 
    investment
    account
    holding
    shares 31.00000
    price 5.00
    commission 5.00
  end

  factory :short do 
    investment
    account
    holding
    shares 75.0
    price 100.00
  end

end
