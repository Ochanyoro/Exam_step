class User < ApplicationRecord

  has_secure_password

  has_many :messages
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  validates :name, {presence: true,uniqueness:true}


  def courses
    return Course.where(user_id: self.id)
  end

end
