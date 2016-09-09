Rails.application.routes.draw do
  root :to => "application#index"

  resources :photographers do
    resources :images
  end
  resources :categories do
    resources :photographers, :only => [:index]
  end
end
