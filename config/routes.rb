Rails.application.routes.draw do
 
  resources :session, only: [:create]
  resources :places
  resources :users

  root 'welcome#index'
  post "/bookmarks" => "places#bookmark", as: "bookmark_create"

  get "/sign_in" => "session#new", as: "sign_in"
  delete "/sign_out" => "session#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  
end
