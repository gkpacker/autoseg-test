class FavoritedTaskListPresenter < SimpleDelegator
  attr_reader :favorited_task_list

  def initialize(favorited_task_list)
    @favorited_task_list = favorited_task_list
    __setobj__(favorited_task_list)
  end

  def eql?(target)
    target == self || favorited_task_list.eql?(target)
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
