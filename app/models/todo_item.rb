class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :todo_list_id, presence: true
  validates :title,        presence: true
end
