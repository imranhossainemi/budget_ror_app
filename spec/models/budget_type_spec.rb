require 'rails_helper'

RSpec.describe BudgetType, type: :model do
  before :each do
    @user = User.create(name: 'test', password: 'testpass', email: 'test@test.com')
    @category = BudgetType.new(name: 'test', icon: 'test')
  end

  describe 'validate data' do
    it 'it should have a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'should have an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end
end
