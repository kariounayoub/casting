class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :evenement
  has_many :reponses, dependent: :destroy
  # has_many :questions, through: :reponses
  accepts_nested_attributes_for :reponses
end
