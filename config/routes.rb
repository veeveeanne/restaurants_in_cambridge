Rails.application.routes.draw do
  root 'restaurants#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants, only: [:new, :create, :index, :show]

  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:index, :show, :create, :destroy] do
        resources :reviews, only: [:index, :create]
      end
    end
  end
end
