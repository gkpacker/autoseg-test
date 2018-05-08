class FavoritedTaskListsController < ApplicationController
  def index
    @favorited_task_lists = FavoritedTaskLists.where(user_id: current_user.id)
  end
end
