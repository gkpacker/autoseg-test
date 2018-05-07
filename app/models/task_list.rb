class TaskList < ApplicationRecord
  belongs_to :user

  enum status: [ :closed, :open ]

  has_many :tasks

  accepts_nested_attributes_for :tasks
end
