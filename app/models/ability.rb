class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all

    if user.has_role? :member
      can :create, Question
      can :create, Answer
      can :create, Vote
      can :destroy, Question, user_id: user.id
      can :destroy, Answer, user_id: user.id
    elsif user.has_role? :moderator
      can :manage, Category
      can :manage, Vote
      can :manage, Question
      can :manage, Answer
    elsif user.has_role? :admin
      can :manage, :all
    end
  end
end
