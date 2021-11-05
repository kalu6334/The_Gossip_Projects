Rails.application.routes.draw do
  get 'cities/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  resources :users
  resources :gossips
  resources :cities
  resources :sessions
 
  root 'page#home'
  get '/team', to: 'page#team'
  get '/contact', to: 'page#contact'
  get '/welcome/:first_name', to: 'page#welcome'
 
  
 
  
end
