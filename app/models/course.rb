class Course < ApplicationRecord
  validates :name,    {presence: true}
  validates :user_id, {presence: true}

  def teachers
    return Teacher.where(course_id: self.id)
  end

end
