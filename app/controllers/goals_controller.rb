class GoalsController < ApplicationController
  
  def new
    @goal = goal.new
  end

  def create
  @goal = Goal.new(goal_params)
  end


  def goal_params
    params.require(:goal).permit(:team_id, :match_id, :user_id)
  end
end