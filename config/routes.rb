Rails.application.routes.draw do
  resources :matchups
  resources :moves
  resources :pokemon_types
  resources :pokemon
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
