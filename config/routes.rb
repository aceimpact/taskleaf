Rails.application.routes.draw do

  get 'tasks/new', to: 'task#new'
  get 'tasks/:id/edit', to: 'task#edit'
  post 'tasks/new', to: 'task#create'
  post 'tasks/:id', to: 'task#update'
  delete 'tasks/:id', to: 'task#destroy'
  root 'task#index'
end
