Rails.application.routes.draw do
  resources :products
  resources :users
  namespace :api do
    namespace :v1 do
      resources :customers
    end

    namespace :v2 do
      resources :customers
    end
    
    namespace :v3 do
      resources :users
    end

    namespace :v4 do
      resources :users
    end

    namespace :v5 do
      resources :users
    end
  end
  resources :customers
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
