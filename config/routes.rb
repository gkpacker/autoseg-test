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
    resources :subtasks, only: [:new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
