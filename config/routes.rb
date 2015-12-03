Rails.application.routes.draw do
	
  get ':controller(/:action(/:id))'
  post ':controller(/:action(/:id))'
  resources :answers
  root 'questions#new'

  post 'create' => 'questions#create'
  resources :questions



end
