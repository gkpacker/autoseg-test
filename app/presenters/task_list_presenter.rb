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

  def subtask_links(subtask)
    subtask.done? ? 'subtask_done_links' : 'subtask_pendant_links'
  end

  def task_links(task)
    task.done? ? 'task_done_links' : 'task_pendant_links'
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
