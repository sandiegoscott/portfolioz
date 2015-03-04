require 'spec_helper'

describe User do

  it "should fail with the wrong password confirmation" do
    user = FactoryGirl.build(:user, email: "joe2@user.com", password_confirmation: 'wrong password')
    expect(user.invalid?(:password_confirmation)).to eq(true)
    expect(user.errors[:password_confirmation]).to eq(["doesn't match Password"])
  end

end
