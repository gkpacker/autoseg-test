class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy]

  def index
    @task_lists = TaskList.all
  end

  def show
  end

  def new
    @task_list = TaskList.new
    @task_list.tasks.build
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

  def edit
    @task_list.tasks.build
  end


  def update
    if @task_list.update_attributes(task_list_params)
      redirect_to @task_list
    else
      render :edit
    end
  end

  def destroy
    @task_list.destroy
    redirect_to root_path
  end

  private

  def set_task_list
    @task_list = TaskList.find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:user_id, :status, tasks_attributes: [:title, :_destroy])
  end
end
