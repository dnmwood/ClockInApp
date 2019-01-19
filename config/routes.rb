Rails.application.routes.draw do

  get 'shifts/index'

  get 'home/index'

  root to: 'home#index'
  resources :shifts, only: [:index, :create]
  get '/clock_out', to: 'shifts#clock_out'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
