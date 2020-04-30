Rails.application.routes.draw do
  root 'restaurants#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants, only: [:new, :create, :index, :show]

  namespace :api do
    namespace :v1 do
      resources :votes, only: [:create, :update, :destroy]
      resources :restaurants, only: [:create, :index, :show, :destroy] do
        resources :reviews, only: [:create, :index]
      end
    end
  end
end
