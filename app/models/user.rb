class User < ApplicationRecord
  has_many :task_lists, dependent: :destroy
  has_many :favorited_task_lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def favorited?(task_list)
    FavoritedTaskList.where(user_id: self.id, task_list_id: task_list.id).present?
  end

  def favorited_task_list(task_list)
    FavoritedTaskList.find_by(user: self, task_list: task_list)
  end
end
