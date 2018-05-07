class TaskList < ApplicationRecord
  belongs_to :user

  enum status: [ :closed, :open ]

  accepts_nested_attributes_for :tasks

  has_many :tasks
end
