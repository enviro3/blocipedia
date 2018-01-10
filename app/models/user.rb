class User < ActiveRecord::Base
  has_many :wikis
  has_many :collaborators

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  enum role: [:member, :admin, :premium]

  before_save { self.role ||= :member }


  def downgrade_user!
    self.update(role: 0)
    private_wikis =  Wiki.where(user_id: self.id, private: true)
    private_wikis.each do |wiki|
      wiki.private = false
      wiki.save
    end
  end

  def self.all_except(user)
    where.not(id: user)
  end
end
