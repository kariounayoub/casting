class Reponse < ApplicationRecord
  belongs_to :inscription
  belongs_to :question
  validates_uniqueness_of :question_id, scope: :inscription_id
end
