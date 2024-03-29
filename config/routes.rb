Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'users/registrations'}

  get :about, to: 'about#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests, only: :index do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :users, only: %i[] do
    resources :badges, only: :index
  end

  resources :badges, only: :index

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers
      end
    end
      resources :gists
      resources :badges
  end

  root to: 'main#index'

end
