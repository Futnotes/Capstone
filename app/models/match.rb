class Match < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  has_many :goals
end
