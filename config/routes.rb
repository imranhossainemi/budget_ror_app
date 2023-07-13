Rails.application.routes.draw do
  get 'budget_types/index'
  get 'budget_types/show'
  get 'budget_types/new'
  devise_for :users
  resources :users
  resources :budget_types
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
