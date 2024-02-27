Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: "users#index"

  # get 'tasks/index'
  # root to: "tasks#index"
end
