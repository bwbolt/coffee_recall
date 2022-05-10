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

  get '/bags', to: 'bags#index'
  get '/bags/:id', to: 'bags#show'
end
