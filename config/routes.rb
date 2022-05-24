Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers
    end
    namespace :v2 do
      resources :customers
    end
  end
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
