class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  has_many :teams
  belongs_to :user
  has_many :goals

  def winner
    #This will require you to write other methods that calculate the goals based on the two teams

    # if home_team.goal.count > away_team.goal.count home_team == winner
    # elsif away_team.goal.count > home_team.goal.count away_team == winner
    # else home_team.goal.count == away_team.goal.count draw



    #
  end

end
