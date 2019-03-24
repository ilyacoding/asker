Rails.application.routes.draw do
  resources :answers
  resources :categories
  devise_for :users
  resources :questions

  root to: "questions#index"
end
