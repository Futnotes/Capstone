class GoalsController < ApplicationController
  
def new
    @goal = goal.new
  end

def create
  @goal = Goal.new(goal_params)
  @match = 
end


def create
    @player = User.new(player_params)
    @team = :team
    if @player.save!
      TeamRole.create(team_id: params[:user][:team_id], user_id: @player.id, role: "player")
      flash[:notice] = "Player was created."
      redirect_to @player.teams.last
    else
      flash[:error] = "There was an error creating the player. Please try again."
      render :new
    end
  end