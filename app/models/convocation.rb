class Convocation < ApplicationRecord
  attr_accessor :inscription_list

  belongs_to :inscription
  validates :heure, :date, :lieu, presence: true
end
