class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all

    if user.member?
      can :manage, Question, user_id: user.id
      # can :manage
      # can :manage, Answer,
    elsif user.moderator?
      # can :manage, Category
      cam :manage, Question
      # cam :manage, Answer
    elsif user.admin?
      can :manage, :all
    end
  end
end
