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

  # Add more helper methods to be used by all tests here...
end

#
# put this in a test class to leave records in database
#
#   self.use_transactional_fixtures = false
#

#
# Test Fabricator
#

Fabricator(:transaction) do
  ddate { Date.today }
  account
end



Fabricator(:experiment) do
  after_build         { puts ">>>>> after_build" }
  name 'Experiment'
end

#
# Common Fabricators
#

Fabricator(:investment) do
  name 'International Business Machines Corp'
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
end

Fabricator(:holding) do
  account
  investment
  shares 100.0
end

Fabricator(:event) do
  ddate { Date.today }
  account
  commission 10.0
  cash_delta 10.0
end

Fabricator(:deposit) do
  ddate { Date.today }
  account
  amount 10.0
end

Fabricator(:withdrawal) do
  ddate { Date.today }
  account
  amount 10.0
end

Fabricator(:interest) do
  ddate { Date.today }
  account
  amount 10.0
end

Fabricator(:expense) do
  ddate { Date.today }
  account
  amount 10.0
end

Fabricator(:dividend) do
  ddate { Date.today }
  account
  investment
  amount 10.0
end

Fabricator(:buy) do
  ddate { Date.today }
  investment
  account
  holding
  shares 100.0
  price 10.0
  commission 10.0
end

Fabricator(:sell) do
  ddate { Date.today }
  investment
  account
  holding
  shares 100.0
  price 10.0
  commission 10.0
end

Fabricator(:short) do
  ddate { Date.today }
  investment
  account
  holding
  shares 100.0
  price 10.0
  commission 10.0
end

Fabricator(:cover) do
  ddate { Date.today }
  investment
  account
  holding
  shares 100.0
  price 10.0
  commission 10.0
end

