class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy]

  def index
    @task_lists = TaskList.where(status: 'open')
  end

  def show
    @task_list = TaskListPresenter.new(@task_list, current_user)
  end

  def new
    @task_list = TaskList.new
    @task_list.tasks.build
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.user = current_user
    if @task_list.save
      respond_with @task_list, location: @task_list
    else
      flash.now[:alert] = "Você deve preencher os campos marcados"
      render :new, alert: flash.now[:alert]
    end
  end

  def edit
    @task_list.tasks.build
  end

  def update
    if @task_list.update_attributes(task_list_params)
      respond_with @task_list, location: @task_list
    else
      @task_list.tasks.build
      render :edit
    end
  end

  def destroy
    @task_list.destroy
    respond_with @task_list, location: root_path
  end

  private

  def set_task_list
    @task_list = TaskList.includes(:tasks, tasks: :subtasks).find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:user_id, :title, :status, :task, tasks_attributes: [:id, :title, :task_list_id, :_destroy])
  end
end
