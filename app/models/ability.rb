class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can :manage, TodoList, user_id: user.id
    can :manage, TodoItem, todo_list: { user_id: user.id }
  end
end
