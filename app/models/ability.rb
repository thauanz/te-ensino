class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    
    if user.role == "admin"
      can :manage, :all
      cannot :read, User, :role => "admin"
      cannot [:create], Matriculation
      cannot :manage, [Asset, Lesson, Alert]
    else
      can :read, [Forum, Message]
      can :update, Forum, :user_id => user.id
      can :create, [Forum, Message], :user_id => user.id
      can :destroy, [Forum, Message] do |message|
        message.try(:user) == user || (user.role == "teacher")
      end
      if user.role == "teacher"
        can [:read, :update], Course, :users => {:id => user.id }
        can [:read, :update], User, :role => "student"
        can :matriculations, Course
        can :manage, [Asset, Alert, Lesson], :user_id => user.id
      else
          if user.role == "student"
            if user.matriculations.where(:enabled => true).present?
              can :read, Matriculation, :user_id => user.id, :enabled => true
              can :read, [Alert, Lesson], :course => {:matriculations => {:enabled => true}}
            end       
          can :read, Course
          can :create, Matriculation
        end
      end
    end

    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
