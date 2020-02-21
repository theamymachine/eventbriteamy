Rails.application.routes.draw do

  root :to => 'events#index'

  devise_for :users

  resources :users

  resources :events do 
    resources :attendances
    resources :event_images, only: [:create]
  end 

  resources :charges
  
end
