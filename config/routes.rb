Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope defaults: { format: :json } do
    post '/createProject', to: 'projects#create'
    get '/requestProject', to: 'projects#show'
  end
end
