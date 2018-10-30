Rails.application.routes.draw do

  root 'task#index'

  resources :tasks, controller: :task ,except: [:index]


end
