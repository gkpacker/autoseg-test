class TaskListPresenter < SimpleDelegator
  include Rails.application.routes.url_helpers

  attr_reader :task_list

  def initialize(task_list, current_user)
    @task_list = task_list
    @current_user = current_user
    __setobj__(task_list)
  end

  def eql?(target)
    target == self || task_list.eql?(target)
  end

  def task_status(task)
    'Tarefa completa' if task.done?
  end

  def subtask_status(subtask)
    'Subtarefa completa' if subtask.done?
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
