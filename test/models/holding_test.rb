require 'test_helper'

class HoldingTest < ActiveSupport::TestCase
  self.use_transactional_fixtures = false

  it "must validate properly" do
    Fabricate(:holding).valid?.must_equal true
    Fabricate.build(:holding, account: nil).valid?.must_equal false
    Fabricate.build(:holding, investment: nil).valid?.must_equal false
    Fabricate.build(:holding, shares: nil).valid?.must_equal false
  end

  it "must updates shares based on events" do
    holding = Fabricate(:holding) #, account: account, investment: investment)
    buy = Fabricate(:buy, investment: holding.investment, account: holding.account, holding: holding, shares: 100.0)
    sell = Fabricate(:sell, investment: holding.investment, account: holding.account, holding: holding, shares: 50.0)
    holding.shares.must_equal 50.0
  end

end
