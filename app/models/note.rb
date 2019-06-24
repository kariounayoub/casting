class Note < ApplicationRecord
  belongs_to :inscription
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :inscription


  NOTES = [1,2,3,4,5,6,7,8,9,10]
end
