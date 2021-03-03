require 'bigdecimal'

class Teacher < ApplicationRecord
  validates :name,    {presence: true}
  validates :course_id, {presence: true}

    def user
      @c = Course.find_by(id:self.course_id)
      return User.find_by(id:@c.user_id)
    end

    def subjects
      return Subject.where(teacher_id: self.id)
    end

    def course_name_name
      @c = Course.find_by(id:self.course_id)
      if @c
        return @c
      else
        return Course.new
      end
    end

    def contents
      @a = Subject.find_by(teacher_id:self.id)
      return Post.find_by(subject_id:@a.id)
    end

    def floor_class
      @a = Subject.where(teacher_id:self.id).sum(:level)
      @c = Subject.where(teacher_id:self.id).count
      @a = @a/@c
      return BigDecimal(@a.to_s).floor(2).to_f # 1.24
    end


end
