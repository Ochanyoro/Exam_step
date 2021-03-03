require 'bigdecimal'

class Subject < ApplicationRecord
  validates :name,    {presence: true}
  validates :teacher_id, {presence: true}

  def user
    @c = Teacher.find_by(id:self.teacher_id)
    @c = Course.find_by(id:@c.course_id)
    return User.find_by(id:@c.user_id)
  end

  def teachers
    return Teacher.find_by(id:self.teacher_id)
  end

  def contents
    @p = Post.where(subject_id:self.id).order(like:"DESC").first
    if @p
      return @p
    else
      return Post.new(content:"")
    end
  end


  def floor_class
    return BigDecimal(Subject.find_by(id:self.id).level.to_s).floor(2).to_f # 1.24
  end


end
