Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/lots', to: 'lots#index'
  get '/lots/new', to: 'lots#new'
  post '/lots', to: 'lots#create'
  get '/lots/:id', to: 'lots#show'
  get '/lots/:id/edit', to: 'lots#edit'
  patch '/lots/:id', to: 'lots#update'
  delete '/lots/:id', to: 'lots#destroy'
  get '/lots/:id/bags', to: 'lots_bags#index'

  get '/bags', to: 'bags#index'
  get '/bags/:id', to: 'bags#show'
  get '/bags/:id/edit', to: 'bags#edit'
  patch '/bags/:id', to: 'bags#update'
  get '/lots/:id/bags/new', to: 'bags#new'
  post '/lots/:id/bags/new', to: 'bags#create'
  delete '/bags/:id', to: 'bags#destroy'
end
