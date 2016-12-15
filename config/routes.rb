Rails.application.routes.draw do
  resources :deliveries
  resources :sales
  resources :statuses
  resources :categories
  resources :items
  root :to => 'items#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
