class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :evenement
  has_many :reponses, dependent: :destroy
  accepts_nested_attributes_for :reponses, update_only: true
  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader
end
