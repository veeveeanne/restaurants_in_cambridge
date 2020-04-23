Rails.application.routes.draw do
  root 'restaurants#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :restaurants, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :restaurants, only: [:index, :show]
    end
  end
end
