Blocnotes::Application.routes.draw do
  
  match "/players/new" => "players#create", :via => [:post]
  get "goals/edit"
  match "availabilities/new" => "availabilities#create", :via => [:post]
  #match "availabilities/delete" => "availabilities#destroy", :via => [:delete]
  match "goals/new" => "goals#create", :via => [:post]
  devise_for :users

  resources :availabilities, only: [:create, :destroy, :new]
  
  resources :teams do
    resources :players, only: [:create]
  end

  resources :matches


  match "about" => 'welcome#about', via: :get

  post "matches/update_goals" => "matches#update_goals" 

  root to: 'welcome#index'
end
