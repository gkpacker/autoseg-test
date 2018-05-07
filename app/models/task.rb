class Task < ApplicationRecord
  belongs_to :task_list
  has_many :subtasks

  enum status: [ :pendant, :done ]

  validates :title, presence: true
end
