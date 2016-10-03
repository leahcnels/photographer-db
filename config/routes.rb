Rails.application.routes.draw do
  root :to => "application#index"
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users do
    resources :images
  end

  resources :categories do
    resources :users, :only => [:index]
  end

  resources :postings

  resources :messages, only: [:new, :create]
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply, :restore, :mark_as_read, :mark_as_unread
    end
    collection do
      delete :empty_trash
    end
  end
end
