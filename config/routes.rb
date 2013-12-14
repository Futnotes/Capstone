Blocnotes::Application.routes.draw do
  
  resources :teams
  
  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
