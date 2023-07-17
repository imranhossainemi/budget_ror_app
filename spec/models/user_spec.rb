require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { @user = User.new(name: 'test', password: 'testpass', email: 'test@test.com') }
  it 'name should be present' do
    expect(@user).to be_valid
    @user.name = nil
    expect(@user).to_not be_valid
  end
  it 'password should be present' do
    expect(@user).to be_valid
    @user.password = nil
    expect(@user).to_not be_valid
  end
  it 'email should be present' do
    expect(@user).to be_valid
    @user.email = nil
    expect(@user).to_not be_valid
  end
end
