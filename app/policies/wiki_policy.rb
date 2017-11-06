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
end
