class TaskListsController < ApplicationController
  def index
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(task_list_params)
    if @task_list.save
      redirect_to @task_list
    else
      render :new
    end
  end

  private

  def task_list_params
    params.require(:task_list).permit(:user_id, :status)
  end
end
