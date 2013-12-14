class TeamsController < ApplicationController
  
  def create
    Team.create(team_params)
  end

  def index
    #probably this needs to be deleted but input now just to gain access to the teams.
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def edit
  end

  private

  def team_params
    params.require(:person).permit(:team_name, :team_name_short)
  end
end
