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
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = "Team was created."
      redirect_to @team
    else
      flash[:error] = "There was an error creating the team. Please try again."
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      flash[:notice] = "Team was updated."
      redirect_to @team
    else
      flash[:error] = "There was an error saving the team details. Please try again."
      render :edit
    end
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :team_name_short)
  end
end
