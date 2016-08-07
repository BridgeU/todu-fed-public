class Api::TodoListsController < ApplicationController
  # Use CanCanCan to preload the @todo_list variable if user is allowed to see it
  load_and_authorize_resource

  def index
    render json: @todo_lists.as_json
  end

  def show
    render json: @todo_list.as_json(include: {todo_items: {only: [:id, :title, :completed]}})
  end

  def create
    if @todo_list.save
      render json: @todo_list.as_json
    else
      render json: @todo_list.errors, status: 422
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      render json: @todo_list.as_json
    else
      render json: @todo_list.errors, status: 422
    end
  end

  def destroy
    @todo_list.destroy!
    render json: {}, status: :ok
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:name)
  end
end
