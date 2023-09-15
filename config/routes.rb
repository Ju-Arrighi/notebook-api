Rails.application.routes.draw do
  resources :kinds
  resources :contacts
  resources :auths
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'
    resource :phone, only: [:create, :update, :destroy]

    resource :address, only: [:show, :create, :update, :destroy]
    resource :address, only: [:show, :create, :update, :destroy], path: 'relationships/addresses'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
