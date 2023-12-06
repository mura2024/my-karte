Rails.application.routes.draw do
  devise_for :users
  # get 'exams/index'
  root to: "exams#index"
  resources :users, only: [:edit, :update]
  resources :medicals, only: [:new, :create]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
