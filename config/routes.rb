Rails.application.routes.draw do

  root 'main#index'

  #регистрация
  get '/signup',        to: 'users#new'
  #вход
  get '/signin',        to: 'sessions#new'
  #выход
  delete '/signout',    to: 'sessions#destroy'

  resources :users
  resources :tests

  #назначить курс
  get '/assign',        to: 'tests#index'
  post '/tests',        to: 'tests#create_dop_info'

  #что назначено
  get '/check',         to: 'users#index'

  post '/tests/:id',    to: 'tests#question'

  resources :sessions, only: [:new, :create, :destroy]

end