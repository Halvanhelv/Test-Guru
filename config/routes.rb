# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations' }
  resources :feedback, only: %i[new create]
  resources :tests, only: :index do
    member do
      post :start
    end
  end
  resources :badges, only: :index
  resources :test_passages, only: %i[show update] do
    member do
      get :result # GET /tests_passages/10/result
      post :gist
    end
  end
  namespace :admin do
    resources :gists, only: :index
    resources :badges
    root 'tests#index'

    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
