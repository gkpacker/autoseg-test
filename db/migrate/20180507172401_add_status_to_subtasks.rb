class AddStatusToSubtasks < ActiveRecord::Migration[5.2]
  def change
    add_column :subtasks, :status, :integer, default: 0
  end
end
