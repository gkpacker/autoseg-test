class Task < ApplicationRecord
  belongs_to :task_list, inverse_of: :tasks, optional: true
  has_many :subtasks, inverse_of: :task, dependent: :destroy

  enum status: [ :pendant, :done ]

  accepts_nested_attributes_for :subtasks, allow_destroy: true

  validates :title, presence: true, allow_blank: false

  def all_subtasks_done?
    subtasks.each do |subtask|
      return false if subtask.pendant?
    end
    true
  end

  def mark_subtasks
    subtasks.each do |subtask|
      subtask.done!
    end
  end

  def unmark_subtasks
    subtasks.each do |subtask|
      subtask.pendant!
    end
  end
end
