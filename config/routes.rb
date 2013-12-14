Blocnotes::Application.routes.draw do
  
  devise_for :users
  resources :teams
  
  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
