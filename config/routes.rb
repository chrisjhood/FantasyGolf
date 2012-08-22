FantasyGolf::Application.routes.draw do
 
  root :to => 'standings#index'
  
  resources :standings
  
  resources :tournaments

  devise_for :users
  resources :users
  
  resources :golfers

  resources :picks

  match "/refresh_tournament_list" => "tournaments#refresh_tournament_list"
  match "/refresh_golfer_list" => "golfers#refresh_golfer_list"
end
