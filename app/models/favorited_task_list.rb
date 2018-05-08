class FavoritedTaskList < ApplicationRecord
  belongs_to :user
  belongs_to :task_list

  validates_uniqueness_of :task_list_id
end
