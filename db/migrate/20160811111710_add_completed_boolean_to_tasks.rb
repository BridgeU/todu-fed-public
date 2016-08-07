class AddCompletedBooleanToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :todo_items, :completed, :boolean, null: false, default: false
  end
end
