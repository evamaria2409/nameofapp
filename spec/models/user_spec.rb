require "rails_helper"

describe User, type: :model do
  it "should not validate users without an email address" do
    @user = FactoryGirl.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end

  it "invalid password rejected" do
    @user = FactoryGirl.build(:user, password: "12")
    expect(@user).not_to be_valid
  end
  
end