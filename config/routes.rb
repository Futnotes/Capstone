Blocnotes::Application.routes.draw do
  
  get "players/new"
  get "goals/new"
  get "goals/edit"
  devise_for :users
  resources :teams
  resources :matches

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
