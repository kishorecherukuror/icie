class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 1
      can :manage, :all
    elsif user.role == 0
        
        can :read, Post, :approved=>true, :user_to_id => user.id
        can :read, Post, :approved=>true, :user_type => -1

        can :manage, Post, :user_from_id => user.id
        can :read, News
        can :create, Post
    elsif user.role == 2
        can :read, Post, :approved=>true, :user_type => 2
        can :read, Post, :approved=>true, :user_to_id => user.id
        can :read, Post, :approved=>true, :user_type => -1

        can :manage, Post, :user_from_id => user.id
        can :read, News
        can :create, Post
    elsif user.role == 3
        can :read, Post, :approved=>true, :user_type => 3
        can :read, Post, :approved=>true, :user_to_id => user.id
        can :read, Post, :approved=>true, :user_type => -1

        can :manage, Post, :user_from_id => user.id
        can :read, News
        can :create, Post
    elsif user.role == 4
        can :read, Post, :approved=>true, :user_type => 4
        can :read, Post, :approved=>true, :user_to_id => user.id
        can :read, Post, :approved=>true, :user_type => -1

        can :manage, Post, :user_from_id => user.id
        can :read, News
        can :create, Post
     elsif user.role == 5
        can :read, Post, :approved=>true, :user_type => 5
        can :read, Post, :approved=>true, :user_to_id => user.id
        can :read, Post, :approved=>true, :user_type => -1

        can :manage, Post, :user_from_id => user.id
        can :read, News
        can :create, Post
     elsif user.role == 6
        can :read, Post, :approved=>true, :user_type => 6
        can :read, Post, :approved=>true, :user_to_id => user.id
        can :read, Post, :approved=>true, :user_type => -1

        can :manage, Post, :user_from_id => user.id
        can :read, News
        can :create, Post
    else
      can :read, :all
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create,, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
