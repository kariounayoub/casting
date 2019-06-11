class Question < ApplicationRecord
  belongs_to :evenement
  has_many :reponses, dependent: :destroy
end
