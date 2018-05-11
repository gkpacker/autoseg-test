class SubtasksController < ApplicationController
  before_action :set_subtask, only: [:destroy, :done, :pendant]

  def destroy
    tasklist = @subtask.task.task_list
    task = @subtask.task
    @subtask.destroy
    task.done! if task.all_subtasks_done?
    respond_with @subtask, location: tasklist
  end

  def done
    @subtask.done!
    task = @subtask.task
    task.done! if task.all_subtasks_done?
    redirect_to @subtask.task.task_list
  end

  def pendant
    @subtask.pendant!
    @subtask.task.pendant!
    redirect_to @subtask.task.task_list
  end

  private

  def flash_interpolation_options
    { resource_name: @subtask.title }
  end

  def set_subtask
    id = params[:id] || params[:subtask_id]
    @subtask = Subtask.find(id)
  end
end
