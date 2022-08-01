Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :groups do
      resources :entities
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "users#index"
end
