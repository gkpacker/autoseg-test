class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :done, :destroy, :pendant]

  def edit
    @task.subtasks.build
  end

  def update
    subtasks = @task.subtasks.count
    if @task.update_attributes(task_params)
      @task.pendant! unless subtasks == @task.subtasks.count
      respond_with @task, location: @task.task_list
    else
      @task.subtasks.build
      render :edit
    end
  end

  def done
    @task.done!
    @task.mark_subtasks
    redirect_to @task.task_list
  end

  def pendant
    @task.pendant!
    @task.unmark_subtasks
    redirect_to @task.task_list
  end


  def destroy
    task_list = @task.task_list
    @task.destroy
    respond_with @task, location: @task.task_list
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
