ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :all

  # Add more helper methods to be used by all tests here...
end

#
# all default Fabrications should valide
#

Fabricator(:investment) do
  name 'IBM'
end

Fabricator(:household) do
  name 'Smith'
end

Fabricator(:brokerage) do
  name 'TD Ameritrade'
  household
end

Fabricator(:account ) do
  name 'Smith IRA'
  brokerage
  # cash defaults to 0.0
end

Fabricator(:holding) do
  investment
  account
  shares 100.0
end

Fabricator(:transaction) do
  account
end

Fabricator(:deposit, from: :transaction) do
  kind :deposit
  amount 100.00
end

Fabricator(:withdrawal, from: :transaction) do
  kind :withdrawal
  amount 100.00
end

Fabricator(:expense, from: :transaction) do
  kind :expense
  amount 100.00
end

Fabricator(:dividend, from: :transaction) do
  investment
  kind :dividend
  amount 100.00
end

Fabricator(:interest, from: :transaction) do
  kind :interest
  amount 100.00
end

Fabricator(:buy, from: :transaction) do
  investment
  holding
  kind :buy
  shares 75.0
  price 100.00
end

Fabricator(:cover, from: :transaction) do
  investment
  account
  holding
  kind :cover
  shares 75.0
  price 100.00
end

Fabricator(:sell, from: :transaction) do
  kind :sell
  investment
  account
  holding
  shares 31.00000
  price 5.00
  commission 5.00
end

Fabricator(:short, from: :transaction) do
  kind :short
  investment
  account
  holding
  shares 75.0
  price 100.00
end


  #enum kind: [:deposit, :withdrawal, :expense, :dividend, :interest, :buy, :cover, , :sell, :short]



