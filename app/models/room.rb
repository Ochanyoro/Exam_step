class Room < ApplicationRecord
  has_many :messages,dependent: :destroy
  belongs_to :subject,optional: true
  belongs_to :course, optional: true
end
