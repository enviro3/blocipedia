class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  class Scope < Scope
    def resolve
      if user != nil && (user.admin? || user.premium?)
        scope.all
      else
        scope.where(:private=>false)
      end
    end
  end

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
end
