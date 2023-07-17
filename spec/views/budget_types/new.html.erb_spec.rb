require 'rails_helper'

RSpec.describe 'budget_types/new.html.erb', type: :view do
  include Devise::Test::IntegrationHelpers
  describe 'New' do
    before(:each) do
      @user = User.create(name: 'Imran', email: 'imranemi@mail.com', password: 123_456)
      sign_in @user
      visit('/budget_types/new')
      fill_in 'budget_type[name]', with: 'test group'
      fill_in 'budget_type[icon]', with: 'test icon'
      click_button 'Create'
    end
    it 'Group name' do
      expect(page).to have_content('test group')
    end
    it 'Group Icon' do
      expect(page).to have_content('test group')
    end
  end
end
