class Evenement < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
end
