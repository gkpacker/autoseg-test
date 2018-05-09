class TasksController < ApplicationController
  before_action :set_task, only: [:done, :destroy]
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
  end

  def done
    @task.done!
    redirect_to @task.task_list
  end

  def destroy
    task_list = @task.task_list
    @task.destroy
    redirect_to task_list
  end

  private

  def set_task
    id = params[:id] || params[:task_id]
    @task = Task.find(id)
  end

  def task_params
    params.require(:task).permit(:title, :task_list_id, :subtasks)
  end
end
