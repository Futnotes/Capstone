class Availability < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :match_id
  belongs_to :user
  belongs_to :match
end
