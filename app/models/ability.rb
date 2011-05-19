class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    
    can :read, [Forum, Message]
    can :update, Forum, :user_id => user.id
    can :create, [Forum, Message], :user_id => user.id
    can :destroy, [Forum, Message] do |message|
      message.try(:user) == user 
    end
    
    if user.role == "admin"
      can :manage, :all
      cannot :read, User, :role => "admin"
      cannot [:create], Matriculation
      cannot :manage, [Asset, Lesson, Alert]
      
    elsif user.role == "teacher"
      can [:read, :update], Course, :users => {:id => user.id }
      can :read, User, :matriculations => {:course_id => user.courses}
      can :update, User, :role => "student"
      can :matriculations, Course
      can :read, [Alert, Lesson], :course => { :users => {:id => user.id }}
      can :copy, Lesson, :user_id => user.id
      can :create, [Alert, Lesson], :user_id => user.id
      can [:update, :destroy], [Alert, Lesson], :course => { :users => {:id => user.id }}
      can :manage, Asset, :user_id => user.id
      can :read, Audit
    
    elsif user.role == "tutor"
      can :read, Course, :tutor_id => user.id
      can :read, User, :matriculations => {:course => { :tutor_id => user.id } }
      can :update, User, :role => "student"
      can :matriculations, Course
      can :read, [Alert, Lesson], :course => { :tutor_id => user.id }
      can [:create], [Alert, Lesson], :user_id => user.id
      can [:update, :destroy], [Alert, Lesson] do |resource|
        resource.course.tutor_id == user.id
      end
      can :manage, Asset, :user_id => user.id
      can :read, Audit
        
    elsif user.role == "student"
      can :read, Matriculation, :user_id => user.id, :enabled => true, :course => {:enabled => true} 
      if user.matriculations.joins(:course).where(:enabled => true, :courses => {:enabled => true}).present?
        can :read, Alert, :course => {:matriculations => {:enabled => true, :user_id => user.id}}
        can :read, Lesson, :course => {:matriculations => {:enabled => true, :user_id => user.id}}, :enabled => true
      end       
      can :read, Course
      can :create, Matriculation
    end
  end
end
