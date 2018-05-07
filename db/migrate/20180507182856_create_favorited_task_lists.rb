class CreateFavoritedTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_task_lists do |t|
      t.references :user, foreign_key: true
      t.references :task_list, foreign_key: true

      t.timestamps
    end
  end
end
