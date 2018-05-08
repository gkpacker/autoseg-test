class User < ApplicationRecord
  has_many :task_lists
  has_many :favorited_task_lists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def favorited?(task_list)
    FavoritedTaskList.where(user: self, task_list: task_list).present?
  end

  def favorited_task_list(task_list)
    FavoritedTaskList.find_by(user: self, task_list: task_list)
  end
end
