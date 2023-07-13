Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions/sessions',
    registrations: 'users/sessions/registrations'
  }
  resources :users
  resources :budget_types, excpt: [:update, :edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
