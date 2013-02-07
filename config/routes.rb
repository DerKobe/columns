Columns::Application.routes.draw do
  devise_for :users

  resources :shortcuts

  root to: 'dashboard#index'
end
