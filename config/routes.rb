Rails.application.routes.draw do

  root 'questions#new'

  post 'create' => 'questions#create'
  resources :questions


end
