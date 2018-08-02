Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'pages#home'
get 'response', to:'pages#response'

get '/hello' => 'pages#private'

get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'

#get 'signup', to: 'users#new'
resource :user

end
