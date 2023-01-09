Rails.application.routes.draw do
  devise_for :users
  root "ctegories#index"
  resources :trnsactions
  resources :ctegories
end
