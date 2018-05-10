Rails.application.routes.draw do
  root to: 'task_lists#index'

  devise_for :users

  resource :users, only: :show
  resources :task_lists do
    get 'favorited_task_lists', to: 'favorited_task_lists#update_favorited_task_list'
  end
  resources :favorited_task_lists, only: [:index]
  resources :tasks, only: [:edit, :update, :destroy] do
    get 'done', to: 'tasks#done'
    get 'pendant', to: 'tasks#pendant'
    resources :subtasks, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :subtasks, only: :destroy do
    get 'done', to: 'subtasks#done'
    get 'pendant', to: 'subtasks#pendant'
  end
end
