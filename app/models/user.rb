class User < ApplicationRecord
  after_commit :send_welcome_email, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :inscription, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  private

  def send_welcome_email
    # UserMailer.with(user: self).welcome.deliver_later
  end
end
