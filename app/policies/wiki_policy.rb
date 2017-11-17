class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def edit?
    update?
  end

  def update?
    (user.present? && wiki.public?)  || (user.present? && wiki.private? && user.admin?) || (user.present? && wiki.private? && user.premium? && wiki.user == user )
  end
end
