class CreateFavoritedTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_task_lists do |t|

      t.timestamps
    end
  end
end
