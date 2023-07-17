require 'rails_helper'

RSpec.describe 'budget_types/show.html.erb', type: :view do
  include Devise::Test::IntegrationHelpers
  describe 'Show' do
    before(:each) do
      @user = User.create(name: 'imran', email: 'emi@mail.com', password: 123_456)
      sign_in @user
      @category = BudgetType.create(author: @user, name: 'Food', icon: 'food')
      @payment = BudgetAffair.create(author: @user, name: 'Pizza', amount: 50)
      @category.budget_affairs << @payment
      @total = @category.budget_affairs.sum(:amount)
      visit budget_type_path(@category.id)
    end
    it 'renders name of Payment' do
      expect(page).to have_content(@payment.name)
    end

    it 'renders total transaction of the category' do
      expect(page).to have_content(@total)
    end

    it 'renders amount of transaction' do
      expect(page).to have_content(@payment.amount)
    end

    it 'renders a button to add transaction' do
      expect(page).to have_content('Add New Budget Affair')
    end

    it 'redirects to a form for new transaction' do
      click_link 'Add New Budget Affair'
      expect(page).to have_current_path(new_budget_type_budget_affair_path(@category.id))
    end
  end
end
