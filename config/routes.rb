Rails.application.routes.draw do
  root 'task#index'
  resources :tasks, controller: :task

  devise_for :users
  resources :users, :only => [:index,:show, :update,:destroy]
end
