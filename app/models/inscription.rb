class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :evenement
  has_many :reponses
  accepts_nested_attributes_for :reponses
end
