class Photo < ApplicationRecord
  belongs_to :iem,optional: true
  mount_uploader :image,ImageUploader
end
