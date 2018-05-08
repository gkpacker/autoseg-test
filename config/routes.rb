Rails.application.routes.draw do
  root to: 'task_lists#index'

  devise_for :users

  resources :task_lists do
    get 'favorited_task_lists', to: 'favorited_task_lists#update_favorited_task_list'
  end
  resources :favorited_task_lists, only: [:index]
  resources :tasks, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
