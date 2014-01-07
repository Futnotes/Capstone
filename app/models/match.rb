class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  has_many :teams
  belongs_to :user
  has_many :goals

  has_many :availabilities

  accepts_nested_attributes_for :goals
  
  def winner
    #This will require you to write other methods that calculate the goals based on the two teams

    # if home_team.goal.count > away_team.goal.count home_team == winner
    # elsif away_team.goal.count > home_team.goal.count away_team == winner
    # else home_team.goal.count == away_team.goal.count draw
  end

  def home_team_score
    Goal.where(team_id: home_team.id).where(match_id: id).all.count
  end

  def away_team_score
    Goal.where(team_id: away_team.id).where(match_id: id).all.count
  end

  def home_team_goals
    Goal.where(team_id: home_team.id).where(match_id: id)
  end

  def away_team_goals
    Goal.where(team_id: away_team.id).where(match_id: id)
  end

end
