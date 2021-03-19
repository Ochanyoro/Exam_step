class User < ApplicationRecord

  has_secure_password
  has_many :messages
  
  validates :name, {presence: true,uniqueness:true}


  def courses
    return Course.where(user_id: self.id)
  end

end
