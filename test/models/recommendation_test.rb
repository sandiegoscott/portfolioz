require 'test_helper'

class RecommendationTest < Minitest::Test
  describe RecommendationTest do
    it "must validate properly" do
      recommendation = Fabricate(:recommendation)
      recommendation.valid?.must_equal true
      recommendation.investment.wont_be_nil
      recommendation.source.wont_be_nil

      Fabricate(:recommendation, investment: nil).valid?.must_equal false
      Fabricate(:recommendation, source: nil).valid?.must_equal false
    end
  end
end
