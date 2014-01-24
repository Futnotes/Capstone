Blocnotes::Application.routes.draw do
  
  match "/players/new" => "players#create", :via => [:post]
  get "goals/edit"
  match "availabilities/new" => "availabilities#create", :via => [:post]
  match "availabilities/delete" => "availabilities#destroy", :via => [:delete]
  match "goals/new" => "goals#create", :via => [:post]
  devise_for :users
  
  resources :teams do
    resources :players, only: [:create]
  end

  resources :matches do
    put :pre_update, to: :pre_update
    put :post_update, to: :post_update
  end

  match "about" => 'welcome#about', via: :get

  post "matches/update_goals" => "matches#update_goals" 

  root to: 'welcome#index'
end
