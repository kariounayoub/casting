class Inscription < ApplicationRecord
  after_create :send_inscription_email

  belongs_to :user
  belongs_to :evenement
  validates_uniqueness_of :user_id, scope: :evenement_id, on: :create
  has_many :reponses, dependent: :destroy
  has_many :notes
  accepts_nested_attributes_for :reponses
  mount_base64_uploader :photo_candidat, PhotoUploader
  mount_base64_uploader :photo_1, PhotoUploader
  mount_base64_uploader :photo_2, PhotoUploader
  mount_base64_uploader :photo_3, PhotoUploader

  private

  def send_inscription_email
    UserMailer.with(inscription: self).inscription.deliver_now
  end
end
