class CreateTodoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_items do |t|
      t.references :todo_list, null: false, foreign_key: true
      t.string :title,         null: false
      t.text :description

      t.timestamps
    end
  end
end
