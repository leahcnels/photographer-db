Rails.application.routes.draw do
  root :to => "application#index"

  resources :photographers do
    resources :images
  end
  resources :categories do
    resources :photographers, :only => [:index]
  end

  resources :users
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
