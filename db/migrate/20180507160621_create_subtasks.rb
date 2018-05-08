class CreateSubtasks < ActiveRecord::Migration[5.2]
  def change
    create_table :subtasks do |t|
      t.string :title, null: false
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
