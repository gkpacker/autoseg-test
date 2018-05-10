require 'rails_helper'

RSpec.describe TaskList, type: :model do

  it "its not valid without a user assigned" do
    expect(TaskList.new).to_not be_valid
  end

  it "its not valid without a title" do
    user = User.create!(email: "test@test.com", password: "123456")

    expect(TaskList.new(user_id: user.id)).to_not be_valid
  end

  it "its valid with a user assigned and title" do
    user = User.create!(email: "test@test.com", password: "123456")

    expect(TaskList.new(user_id: user.id, title: 'test')).to be_valid
  end

  it "should have 'open' status when creating a new task list with open value" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, status: 'open', title: 'test')

    expect(task_list.open?).to eq true
  end

  it "should set 'open' to false when creating a new task list" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, title: 'test')

    expect(task_list.open?).to eq false
  end

  it "should change task list 'open' status" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, title: 'test')
    task_list.open!

    expect(task_list.open?).to eq true
  end
end
