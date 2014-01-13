class GoalsController < ApplicationController
  
  def index

  end

  def new

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

  def edit
    @goal = Goal.find(params[:id])
    @zebra = Team.find(@match.away_team_id).team_name
  end

  def update

  end

  def destroy
      Goal.find(params[:id]).destroy
      binding.pry
      redirect_to :action => '@match/show'
  end

private

  def goal_params
    params.require(:goal).permit(:team_id, :match_id, :user_id)
  end
end