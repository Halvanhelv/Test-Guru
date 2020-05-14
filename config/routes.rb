# frozen_string_literal: true

Rails.application.routes.draw do


  root 'tests#index'
  devise_for :users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations' }


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
      get :result # GET /tests_passages/10/result
    end
  end
end
