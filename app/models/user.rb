class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis


  def downgrade_user!
    self.update(role: 0)
    private_wikis =  Wiki.where(user_id: user.id, private: true)
    private_wikis.each do |wiki|
      wiki.private = false
    end
    wiki.save
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  before_save { self.role ||= :member }

  enum role: [:member, :admin, :premium]
end
