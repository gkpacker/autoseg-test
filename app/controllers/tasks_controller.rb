class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :done, :destroy]

  def edit
    @task.subtasks.build
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to @task.task_list
    else
      @task.subtasks.build
      render :edit
    end
  end

  def done
    @task.done!
    subtasks_done(@task)
    redirect_to @task.task_list
  end

  def subtasks_done(task)
    task.subtasks.each do |subtask|
      subtask.done!
    end
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
    params.require(:task).permit(:title, :task_list_id, subtasks_attributes: [:id, :task_id, :_destroy, :title])
  end
end
