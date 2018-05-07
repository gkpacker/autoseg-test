class TaskList < ApplicationRecord
  belongs_to :user

  enum status: [ :public, :private ]

  has_many :tasks
end
