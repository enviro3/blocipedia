class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    if wiki.private
      user != nil && (user.admin? || user.premium?)
    else
      true
    end
  end

  def destroy?
    wiki.user.id === user.id || user.admin?
  end

  def edit?
    update?
  end

  def create?
    user.present?
  end

  def update?
    (user.present? && wiki.public?)  || (user.present? && wiki.private? && user.admin?) || (user.present? && wiki.private? && user.premium? && wiki.user == user )
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user != nil && user.role =='admin'
        wikis = scope.all # if the user is an admin, show them all the wikis
      elsif user != nil && user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          user_ids = wiki.collaborators.map {|collaborator| collaborator.user_id}
          if wiki.public? || wiki.user == user || user_ids.include?(user.id)
            wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
          end
        end
      else # this is the lowly standard user
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          user_ids = wiki.collaborators.map {|collaborator| collaborator.user_id}
          if wiki.public? || wiki.collaborators.include?(user)
            wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
          end
        end
      end
      wikis # return the wikis array we've built up
    end
  end
end
