class FavoritedTaskListsController < ApplicationController
  before_action :set_task_list, only: :update_favorited_task_list

  def index
    @favorited_task_lists = FavoritedTaskList.includes(:task_list).where(user_id: current_user.id)
  end

  def update_favorited_task_list
    @favorited_task_list = current_user.favorited_task_list(@task_list)
    return @favorited_task_list.destroy if @favorited_task_list
    @favorited_task_list = FavoritedTaskList.new(task_list: @task_list)
    @favorited_task_list.user = current_user
    @favorited_task_list.save
  end

  private

  def set_task_list
    @task_list = TaskList.includes(:user, tasks: :subtasks).find(params[:task_list_id])
  end
end
