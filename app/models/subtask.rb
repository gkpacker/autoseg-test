class Subtask < ApplicationRecord
  belongs_to :task

  enum status: [ :done, :pendent ]

  validates :title, presence: true
end
