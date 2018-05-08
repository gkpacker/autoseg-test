class Task < ApplicationRecord
  belongs_to :task_list, inverse_of: :tasks
  has_many :subtasks

  enum status: [ :pendant, :done ]

  validates :title, presence: true, allow_blank: false
end
