Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users
  resources :musics do
    resources :likes
    post 'search',  :on => :collection
end
end
