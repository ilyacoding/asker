Rails.application.routes.draw do
  resources :answers do
    post "vote"
  end
  resources :categories
  devise_for :users
  resources :questions

  root to: "questions#index"
end
