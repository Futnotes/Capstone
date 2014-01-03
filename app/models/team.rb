class Team < ActiveRecord::Base
  has_many :users, through: :team_roles
  has_many :team_roles
  has_many :home_matches, foreign_key: :home_team_id, class_name: Match
  has_many :away_matches, foreign_key: :away_team_id, class_name: Match
  has_many :goals, through: :users

  def team_matches
    self.home_matches + self.away_matches   
  end
  
end
