class SubtasksController < ApplicationController
  before_action :set_subtask

  def destroy
    tasklist = @subtask.task.task_list
    @subtask.destroy
    redirect_to tasklist
  end

  def done
    @subtask.done!
    @subtask.task.done! if all_subtasks_done?(task)
    redirect_to @subtask.task.task_list
  end

  def all_subtasks_done?(task)
    task.subtasks.each do |subtask|
      return false unless subtask.done?
    end
  end

  private

  def set_subtask
    id = params[:id] || params[:subtask_id]
    @subtask = Subtask.find(id)
  end
end
