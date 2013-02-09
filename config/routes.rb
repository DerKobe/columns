Columns::Application.routes.draw do
  devise_for :users

  resources :columns, except: [:index, :show]
  resources :shortcuts, except: [:index, :show]

  get 'arrange' => 'arrange#index'

  root to: 'dashboard#index'
end
