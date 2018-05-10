require 'rails_helper'

RSpec.describe Task, type: :model do

  it "its not valid without a task list assigned" do
    expect(Task.new).to_not be_valid
  end

  it "its not valid without a title" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, title: 'test')

    expect(Task.new(task_list_id: task_list.id)).to_not be_valid
  end

  it "its valid with a title and task list assigned" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, title: 'test')

    expect(Task.new(title: "new task", task_list_id: task_list.id)).to be_valid
  end

  it "set 'done' to false when creating a new task" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, title: 'test')
    task = Task.create!(title: "new task", task_list_id: task_list.id)

    expect(task.done?).to eq false
  end

  it "change task 'done' status to true" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, title: 'test')
    task = Task.create!(title: "new task", task_list_id: task_list.id)
    task.done!

    expect(task.done?).to eq true
  end

  it "return true if all subtasks are done" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, title: 'test')
    task = Task.create!(title: "new task", task_list_id: task_list.id)
    subtask1 = Subtask.create!(title: "new task", task_id: task.id, status: 'done')
    subtask2 = Subtask.create!(title: "new task2", task_id: task.id, status: 'done')

    expect(task.all_subtasks_done?).to eq true
  end

  it "return false if one or more subtask is pendant" do
    user = User.create!(email: "test@test.com", password: "123456")
    task_list = TaskList.create!(user_id: user.id, title: 'test')
    task = Task.create!(title: "new task", task_list_id: task_list.id)
    subtask1 = Subtask.create!(title: "new task", task_id: task.id, status: 'done')
    subtask2 = Subtask.create!(title: "new task2", task_id: task.id)

    expect(task.all_subtasks_done?).to eq false
  end
end
