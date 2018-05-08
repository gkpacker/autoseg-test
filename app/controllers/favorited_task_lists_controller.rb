class FavoritedTaskListsController < ApplicationController
  def index
    @favorited_task_lists = FavoritedTaskList.where(user_id: current_user.id)
  end

  def create
    favorited = FavoritedTaskList.new(favorited_task_lists_params)
    favorited.user = current_user
    favorited.save
  end

  private

  def favorited_task_lists_params
    params.require(:favorited_task_list).permit(:task_list_id)
  end
end
