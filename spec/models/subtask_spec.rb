require 'rails_helper'

RSpec.describe Subtask, type: :model do

  it "its not valid without a task assigned" do
    expect(Subtask.new(title: 'new subtask')).to_not be_valid
  end

  it "its not valid without a title" do
    user = User.create!(email: 'test@test.com', password: '123456')
    task_list = TaskList.create!(user_id: user.id)
    task = Task.create!(task_list_id: task_list.id, title: 'new task')

    expect(Subtask.new(task_id: task.id)).to_not be_valid
  end

  it "its valid with a title and task assigned" do
    user = User.create!(email: 'test@test.com', password: '123456')
    task_list = TaskList.create!(user_id: user.id)
    task = Task.create!(title: 'new task', task_list_id: task_list.id)

    expect(Subtask.new(title: 'new subtask', task_id: task.id)).to be_valid
  end

  it "should set 'done' to false when creating a new subtask" do
    user = User.create!(email: 'test@test.com', password: '123456')
    task_list = TaskList.create!(user_id: user.id)
    task = Task.create!(title: 'new task', task_list_id: task_list.id)
    subtask = Subtask.create!(title: 'new subtask', task_id: task.id)

    expect(subtask.done?).to eq false
  end

  it "should change subtask 'done' status to true" do
    user = User.create!(email: 'test@test.com', password: '123456')
    task_list = TaskList.create!(user_id: user.id)
    task = Task.create!(title: 'new task', task_list_id: task_list.id)
    subtask = Subtask.create!(title: 'new subtask', task_id: task.id)

    subtask.done!

    expect(subtask.done?).to eq true
  end

end
