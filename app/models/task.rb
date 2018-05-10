class Task < ApplicationRecord
  belongs_to :task_list, inverse_of: :tasks, optional: true
  has_many :subtasks, inverse_of: :task, dependent: :destroy

  enum status: [ :pendant, :done ]

  accepts_nested_attributes_for :subtasks, allow_destroy: true

  validates :title, presence: true, allow_blank: false
end
