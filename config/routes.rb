Rails.application.routes.draw do
  root 'restaurants#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants, only: [:new, :create, :index, :show]

  namespace :api do
    namespace :v1 do
<<<<<<< HEAD
      resources :restaurants, only: [:index, :show, :create, :destroy] do
        resources :reviews, only: [:index, :create]
      end
=======
      resources :restaurants, only: [:index, :show, :destroy]
>>>>>>> 33ec441631d9606d365178caf5b332bcc876c24c
    end
  end
end
