Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :kinds
  resources :auths

  # scope module: 'v1' do
  # api_version(:module => "v1", :parameter => {:name => "version", :value => "1"}) do
  api_version(:module => "v1", :header => {:name => "Accept", :value => "version=1"}) do
    resources :contacts do #, constraints: lambda { |request| request.params[:version] == '1' } do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
      resource :phone, only: [:create, :update, :destroy]

      resource :address, only: [:show, :create, :update, :destroy]
      resource :address, only: [:show, :create, :update, :destroy], path: 'relationships/addresses'
    end
  end
  api_version(:module => "v2", :header => {:name => "X-Version", :value => "2.0"}) do #Customized
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'
      resource :phone, only: [:create, :update, :destroy]

      resource :address, only: [:show, :create, :update, :destroy]
      resource :address, only: [:show, :create, :update, :destroy], path: 'relationships/addresses'
    end
  end
end
