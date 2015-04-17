require 'spec_helper'

describe User do

  before :each do
    @user = User.new
    @user.password = "secretpassword"
    @user.name = "Bobby"
    @user.active = true
  end

  it 'should successfully deactivate accounts' do
    expect(@user.active).to eq(true)
    @user.deactivate
    expect(@user.active).to eq(false)
  end

  it 'should successfully reactivate accounts' do
  	@user.active = false
  	expect(@user.active).to eq(false)
  	@user.reactivate
  	expect(@user.active).to eq(true)
  end

end
