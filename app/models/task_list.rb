class TaskList < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :task_list

  enum status: [ :closed, :open ]

  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :no_title

  def no_title(attributes)
    attributes[:title].blank?
  end
end
