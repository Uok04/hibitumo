Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: "users#index"

  resources :tasks, only: [:new]

end
