Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :students, only: [:index, :create, :update]
      get 'students/:name', to: 'students#show'
      post '/presigned_url', to: 'direct_upload#create'
    end
  end
end
