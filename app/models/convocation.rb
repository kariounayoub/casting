class Convocation < ApplicationRecord
  attr_accessor :inscription_list
  after_commit :send_convocation_email, on: :create

  belongs_to :inscription
  has_many :notes
  validates :heure, :date, :lieu, presence: true

  def avg_note_cuisine
    (self.notes.map{|n| n.note_cuisine.nil? ? 0 : n.note_cuisine}&.sum.to_f / self.notes.map{|n| n.note_cuisine}&.size)
  end

  def avg_note_personalite
    (self.notes.map{|n| n.note_personalite.nil? ? 0 : n.note_personalite}&.sum.to_f / self.notes.map{|n| n.note_personalite}&.size)
  end

  def send_convocation_email
    # UserMailer.with(convocation: self).convocation.deliver_later
    # self.mail_envoye = true
    # self.save
  end
end
