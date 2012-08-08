FantasyGolf::Application.routes.draw do
 
  root :to => 'standings#index'
  
  resources :standings
  
  resources :tournaments

  devise_for :users
  resources :users
  
  resources :golfers

  resources :picks

 
end
