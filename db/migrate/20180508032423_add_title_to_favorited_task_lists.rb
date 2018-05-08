class AddTitleToFavoritedTaskLists < ActiveRecord::Migration[5.2]
  def change
    add_column :favorited_task_lists, :title, :string
  end
end
