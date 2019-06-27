class Convocation < ApplicationRecord
  attr_accessor :inscription_list
  after_commit :send_convocation_email, on: :create

  belongs_to :inscription
  validates :heure, :date, :lieu, presence: true

  def send_convocation_email
  end
end
