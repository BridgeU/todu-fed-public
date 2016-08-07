class Api::TodoItemsController < ApplicationController
  load_and_authorize_resource :todo_list
  load_and_authorize_resource through: :todo_list, shallow: true

  def show
    render json: rendered(@todo_item)
  end

  def create
    if @todo_item.save
      render json: rendered(@todo_item)
    else
      render json: @todo_item.errors, status: 400
    end
  end

  def update
    if @todo_item.update_attributes(todo_item_params)
      render json: rendered(@todo_item)
    else
      render json: @todo_item.errors, status: 400
    end
  end

  def mark_complete
    if @todo_item.update(completed: true)
      render json: rendered(@todo_item)
    else
      render json: @todo_item.errors, status: 400
    end
  end

  def destroy
    @todo_item.destroy!
    render json: {}, status: :ok
  end

  private

  def rendered(item)
    item.as_json(only: [:id, :todo_list_id, :title, :completed, :created_at, :updated_at])
  end

  def todo_item_params
    params.require(:todo_item).permit(:title, :description)
  end
end
