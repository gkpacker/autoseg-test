class Subtask < ApplicationRecord
  belongs_to :task

  enum status: [ :pendant, :done ]

  validates :title, presence: true
end
