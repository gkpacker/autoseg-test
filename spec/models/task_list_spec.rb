require 'rails_helper'

RSpec.describe TaskList, type: :model do
  it "its not valid without a user assigned" do
    expect(TaskList.new).to_not be_valid
  end

  it "its valid with a user assigned" do
    user = User.create!(email: "test@test.com", password: "123456")

    expect(TaskList.new(user_id: user.id)).to be_valid
  end

  it "should set 'public' to false when creating a new task list" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id)
    task = Task.create!(title: "new task", task_list_id: task_list.id)

    expect(task.public?).to eq false
  end

  it "should change task list 'public' status" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id)
    task = Task.create!(title: "new task", task_list_id: task_list.id)
    task.public!

    expect(task.public?).to eq true
  end

end
