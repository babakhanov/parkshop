Rails.application.routes.draw do
  root to: 'categories#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories

end
