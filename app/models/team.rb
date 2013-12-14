class Team < ActiveRecord::Base
  has_many :users, through: :team_role
  has_many :team_roles
end
