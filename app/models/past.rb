class Past < ApplicationRecord
  has_many_attached :images

  validates :name,    {presence: true}
  validates :subject_id, {presence: true}
  validates :post_at, {presence:true}
  validates :level,   {presence:true}
  validates :when,    {presence:true}

end
