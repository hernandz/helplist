Rails.application.routes.draw do

  root 'questions#new'

  get 'create'      => 'questions#create'

end
