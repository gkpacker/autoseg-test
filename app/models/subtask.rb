class Subtask < ApplicationRecord
  belongs_to :task, inverse_of: :subtasks

  enum status: [ :pendant, :done ]

  validates :title, presence: true
end
