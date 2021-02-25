Rails.application.routes.draw do
  get 'signup'  => 'users#new'
  resources :users

  get '/login' => 'sessions#new'
end
