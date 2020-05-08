# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'tests#index'
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
