class Note < ApplicationRecord
  belongs_to :inscription, optional: true
  belongs_to :convocation, optional: true
  belongs_to :user
  validates_uniqueness_of :user_id, scope: [:inscription, :convocation]


  NOTES = [1,2,3,4,5,6,7,8,9,10]
end
