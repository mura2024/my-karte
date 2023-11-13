Rails.application.routes.draw do
  devise_for :users
  # get 'exams/index'
  root to: "exams#index"
  resources :users, only: [:edit, :update]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
