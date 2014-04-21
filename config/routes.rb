Texter::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :users
  resources :addresses
  root to: "texts#index"
  resources :texts
end
