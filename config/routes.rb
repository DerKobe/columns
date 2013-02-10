Columns::Application.routes.draw do
  devise_for :users

  resources :columns, except: [:index, :show]
  resources :shortcuts, except: [:index, :show]

  get  'arrange' => 'arrange#index'
  post 'arrange/shortcut' => 'arrange#update_shortcut'
  post 'arrange/column' => 'arrange#update_column'

  root to: 'dashboard#index'
end
