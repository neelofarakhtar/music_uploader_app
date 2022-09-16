Rails.application.routes.draw do
  # post 'playlists/create'
  devise_for :users
  root 'users#index'
  resources :users
  resources :musics do
    resources :likes
end
resources :musics do
  resources :playlists
end
end
