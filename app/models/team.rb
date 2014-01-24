class Team < ActiveRecord::Base
  has_many :users, through: :team_roles
  has_many :team_roles
  has_many :home_matches, foreign_key: :home_team_id, class_name: Match
  has_many :away_matches, foreign_key: :away_team_id, class_name: Match
  has_many :goals, through: :users


  def future_matches
    self.home_matches.future_fixtures + self.away_matches.future_fixtures   
  end

  def past_matches
    self.home_matches.past_results + self.away_matches.past_results   
  end
end
