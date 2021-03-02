Rails.application.routes.draw do
  root 'tickets#index'

  get '/tickets' => 'tickets#index'
  get 'tickets/:id' => 'tickets#show', as: :ticket do

  end
  post 'tickets' => 'tickets#create'
  get 'tickets/:id/close' => 'tickets#update', as: :ticket_close #quickfix
  # patch 'tickets/:id' => 'tickets#update', as: :ticket_close

  # TODO :id -> :ticket_id
  get 'tickets/:id/comments/new' => 'comments#new', as: :ticket_comment
  post 'comments' => 'comments#create'

  resources :users

  get 'signup'  => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy' #quickfix
  # delete 'logout' => 'sessions#destroy', as: :logout
end
