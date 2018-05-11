class Task < ApplicationRecord
  belongs_to :task_list, inverse_of: :tasks, optional: true
  has_many :subtasks, inverse_of: :task, dependent: :destroy

  enum status: [ :pendant, :done ]

  accepts_nested_attributes_for :subtasks, allow_destroy: true

  validates :title, presence: true, allow_blank: false

  after_update :broadcast_notification

  def broadcast_notification
    ActionCable.server.broadcast("notifications", {
      notification_partial: ApplicationController.renderer.render(
        partial: "task_lists/notifications",
        locals: { task_list: task_list }
      ),
      users_who_favorited: task_list.users_who_favorited
    })
  end

  def all_subtasks_done?
    subtasks.select(&:pendant?).empty?
  end

  def mark_subtasks
    subtasks.map(&:done!)
  end

  def unmark_subtasks
    subtasks.map(&:pendant!)
  end
end
