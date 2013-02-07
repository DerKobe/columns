Columns::Application.routes.draw do
  devise_for :users

  resources :columns
  resources :shortcuts

  root to: 'dashboard#index'
end
