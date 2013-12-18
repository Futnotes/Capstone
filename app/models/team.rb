class Team < ActiveRecord::Base
  has_many :users, through: :team_roles
  has_many :team_roles
  has_many :matches
end
