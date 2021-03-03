class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :subject_id, {presence: true}
  validates :level,      {presence: true}

  def subjects
    return Subject.find_by(id:self.subject_id)
  end


end
