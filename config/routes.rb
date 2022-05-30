Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :users, only: :create 
  resources :sessions, only: :create

  root to: 'questions#index'
end
