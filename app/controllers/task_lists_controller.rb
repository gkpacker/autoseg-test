class TaskListsController < ApplicationController
  before_action :set_task_list, only: :show

  def index
    @task_lists = TaskList.all
  end

  def show
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.user = current_user

    if @task_list.save
      redirect_to @task_list
    else
      render :new
    end
  end

  private

  def set_task_list
    @task_list = TaskList.find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:user_id, :status)
  end
end
