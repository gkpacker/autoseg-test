class TaskList < ApplicationRecord
  belongs_to :user

  enum status: [ :closed, :open ]
  enum state: [ :not_favorited, :favorited ]

  has_many :tasks
end
