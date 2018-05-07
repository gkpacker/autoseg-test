class Task < ApplicationRecord
  belongs_to :task_list
  has_many :subtasks

  validates :title, presence: true
end
