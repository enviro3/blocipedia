class Wiki < ActiveRecord::Base
  belongs_to :user
  #has_many: collaborators, through: user

  def public?
    !private
  end
end
