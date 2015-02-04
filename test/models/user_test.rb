require 'test_helper'

class UserTest < Minitest::Test
  describe UserTest do
    it "must validate properly" do
      user = Fabricate(:user)
      user.valid?.must_equal true
      user.admin?.must_equal true

      user = Fabricate.build(:user, email: "joe2@user.com", password_confirmation: 'wrong password')
      user.invalid?(:password_confirmation).must_equal true
      user.errors[:password_confirmation].must_equal ["doesn't match Password"]
    end
  end
end
