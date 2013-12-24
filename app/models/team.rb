class Team < ActiveRecord::Base
  has_many :users, through: :team_roles
  has_many :team_roles
  has_many :matches
  has_many :goals, through: :users

  def team_matches
    self.matches
  end
  
end
