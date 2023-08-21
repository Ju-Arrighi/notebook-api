Rails.application.routes.draw do
  resources :kinds
  resources :contacts

  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'
  end

  resources :contacts do
    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'
  end

   resources :contacts do
    resource :address, only: [:show, :create, :update]
    resource :address, only: [:show, :create, :update], path: 'relationships/addresses'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
