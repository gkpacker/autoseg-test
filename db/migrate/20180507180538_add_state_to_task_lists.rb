class AddStateToTaskLists < ActiveRecord::Migration[5.2]
  def change
    add_column :task_lists, :state, :integer, default: 0
  end
end
