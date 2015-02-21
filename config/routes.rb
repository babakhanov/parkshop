Rails.application.routes.draw do

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'categories#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  resources :products
  resource :order_item
  resource :order

end
