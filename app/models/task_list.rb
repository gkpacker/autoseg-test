class TaskList < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :task_lists

  enum status: [ :closed, :open ]

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end
