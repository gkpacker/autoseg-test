class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:title, :task_list_id)
  end
end
