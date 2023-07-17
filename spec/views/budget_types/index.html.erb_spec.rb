require 'rails_helper'

RSpec.describe 'budget_types/index.html.erb', type: :view do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @user = User.create(name: 'imran', email: 'imran@mail.com', password: 123_456)
    sign_in @user
    @category = BudgetType.create(author: @user, name: 'Food', icon: 'Food')
    @total = @category.budget_affairs.sum { |bf| bf[:amount] }

    assign(:budget_types, [@category]) # Set up the instance variable used in the view

    render # Render the view template
  end

  it 'renders name of category' do
    expect(rendered).to have_content(@category.name)
  end

  it 'displays the icon' do
    expect(rendered).to have_content(@category.icon)
  end

  it 'renders total transaction of the category' do
    expect(rendered).to have_content(@total)
  end

  it 'renders remove button' do
    expect(rendered).to have_content('Remove')
  end

  it 'renders a button to add category' do
    expect(rendered).to have_content('Add Budget Type')
  end

  it 'redirects to a form for new category' do
    expect(rendered).to have_link('Add Budget Type', href: new_budget_type_path)
  end
end
