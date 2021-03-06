# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
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
    # here are :read, :create, :update and :destroy.
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
      if user.has_role? :admin  #这里的admin权限等级最高，能增删查
        can :manage, :all
      elsif user.has_role? :master  #这里的master权限等级次于admin，能增改查，没有删除功能。
        can :manage, :all
        cannot :destroy, User  #这里就是去掉删除用户功能。
      elsif user.has_role? :member
        can :read, :all    #else之后的用户只有只读和修改自己签名功能。
        #can :manage , :user
        can :manage, User, :id => user.id
        can :manage, Signature, :user_id => user.id
        can :manage, Article, :user_id => user.id  #可以删掉自己帖子中的回贴
        can :like, Article
        can :manage, Forum
        cannot :edit, Forum
        cannot :destroy, Article  #这里就是去掉删除功能。
      else
        can :read, :all
      end
  end
end
