Rails.application.routes.draw do
  devise_for :users
  root to: "exams#index"
  resources :users, only: [:edit, :update]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :medicals, only: [:new, :create]
end
