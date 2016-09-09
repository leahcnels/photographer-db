Rails.application.routes.draw do
  root :to => 'photographers#index'

  resources :photographers do
    resources :images
  end
  resources :categories do
    resources :photographers, :only => [:index]
  end
end
