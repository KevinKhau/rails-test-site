Rails.application.routes.draw do
  root 'tickets#index'
  get 'tickets' => 'tickets#index'
  get 'tickets/:id' => 'tickets#show', as: :ticket
  post 'tickets' => 'tickets#create'

  get 'signup'  => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy' #quickfix
  delete 'logout' => 'sessions#destroy'
end
