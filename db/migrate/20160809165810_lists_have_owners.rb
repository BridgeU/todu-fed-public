class ListsHaveOwners < ActiveRecord::Migration[5.0]
  def change
    add_reference :todo_lists, :user, foreign_key: true, null: false, default: -1
  end
end
