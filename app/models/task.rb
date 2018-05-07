class Task < ApplicationRecord
  belongs_to :task_list
  has_many :subtasks

  enum status: [ :done, :pendent ]

  validates :title, presence: true
end
