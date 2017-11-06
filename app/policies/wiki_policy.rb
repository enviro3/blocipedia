class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def update?
    user.admin? or not post.published?
  end

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end
end
