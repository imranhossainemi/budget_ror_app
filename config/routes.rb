Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :budget_types, excpt: [:update, :edit] do 
    resources :budget_affairs, except: [:update, :edit]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
