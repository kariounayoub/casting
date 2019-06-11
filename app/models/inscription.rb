class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :evenement
  has_many :reponses, dependent: :destroy
  accepts_nested_attributes_for :reponses
  mount_base64_uploader :photo_1, PhotoUploader
  mount_base64_uploader :photo_2, PhotoUploader
  mount_base64_uploader :photo_3, PhotoUploader
end
