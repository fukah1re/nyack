Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/index'
  get 'posts/show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_in", to: "users/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
