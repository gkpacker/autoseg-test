require 'rails_helper'

RSpec.describe FavoritedTaskList, type: :model do

  it "its valid with a user and a task list" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id)

    expect(FavoritedTaskList.new(user_id: user.id, task_list_id: task_list.id)).to be_valid
  end

  it "its not valid without a task list" do
    user = User.create!(email: "test@test.com", password: "123456")

    expect(FavoritedTaskList.new(user_id: user.id)).to_not be_valid
  end

  it "its valid without a user" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id)

    expect(FavoritedTaskList.new(task_list_id: task_list.id)).to_not be_valid
  end

end
