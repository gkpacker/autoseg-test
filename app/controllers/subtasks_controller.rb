class SubtasksController < ApplicationController
  before_action :set_subtask
  def destroy
    tasklist = @subtask.task.task_list
    @subtask.destroy
    redirect_to tasklist
  end

  def done
    @subtask.done!
    redirect_to @subtask.task.task_list
  end

  private

  def set_subtask
    id = params[:id] || params[:subtask_id]
    @subtask = Subtask.find(id)
  end
end
