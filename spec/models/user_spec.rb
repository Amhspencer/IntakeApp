require 'spec_helper'

describe User do

  before :each do
    @user = User.new
    @user.password = "secretpassword"
    @user.name = "Bobby"
  end

  it "correctly initializes a name and password" do
    @user.name.should be_an_instance_of String
    @user.password.should be_an_instance_of String
  end

end
