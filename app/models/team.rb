class Team < ActiveRecord::Base
  has_many :users, through: :team_roles
  has_many :team_roles
  has_many :matches, foreign_key: :home_team_id
  has_many :matches, foreign_key: :away_team_id
  has_many :goals, through: :users

  def team_matches
    self.matches
  end
  
end
