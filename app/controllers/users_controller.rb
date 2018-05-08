class UsersController < ApplicationController
  def show
    @private_task_lists = TaskList.where(user: current_user, status: 'closed')
    @public_task_lists = TaskList.where(user: current_user, status: 'open')
  end
end
