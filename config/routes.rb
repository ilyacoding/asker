Rails.application.routes.draw do
  resources :answers do
    post "vote"
  end
  resources :categories
  devise_for :users, controllers: { registrations: "registrations" }
  resources :questions
  resources :users, only: :index do
    post "make_admin"
    post "make_moderator"
    post "make_member"
  end

  root to: "questions#index"
end
