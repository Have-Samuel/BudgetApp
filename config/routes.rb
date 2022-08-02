Rails.application.routes.draw do
  get 'entities/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/session#destory'
  end
  get '/categories/index', to: "categories#index"
  get '/categories/new', to: "categories#new", as: 'categories_new'
  post '/categories/new', to: "categories#create", as: 'categories_create'
  get '/entities/index/:category_id', to: 'entities#index'
  get 'entities/show/:entity_id/:category_id', to: "entities#show", as: 'entity_detail'
  get '/entities/new/:category_id', to: 'entities#new', as: 'entities_new'
  post '/entities/new', to: 'entities#create', as: 'entity_create'
  root 'splash#show'
  get 'splash/show'
  # devise_for :users
  # resources :users do
  #   resources :groups do
  #     resources :entities
  #   end
  # end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: "users#index"
end
