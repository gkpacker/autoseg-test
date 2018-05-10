class TaskList < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :task_list, dependent: :destroy

  enum status: [ :closed, :open ]

  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates :title, presence: true
end
