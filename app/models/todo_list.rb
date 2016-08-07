class TodoList < ApplicationRecord
  belongs_to :user

  has_many :todo_items, dependent: :destroy

  validates :name, presence: true

  delegate :to_s, to: :name
end
