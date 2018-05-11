class TaskList < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :task_list, dependent: :destroy

  enum status: [ :closed, :open ]

  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates :title, presence: true

  after_update :broadcast_notification


  def broadcast_notification
    ActionCable.server.broadcast("notifications", {
      notification_partial: ApplicationController.renderer.render(
        partial: "task_lists/notifications",
        locals: { task_list: self }
      ),
      task_list: self,
      users_who_favorited: users_who_favorited
    })
  end

  def users_who_favorited
    users = []
    FavoritedTaskList.where(task_list: self).each do |favorited_task_list|
      users << favorited_task_list.user.id
    end
    users
  end

end
