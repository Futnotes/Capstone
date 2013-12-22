class PlayersController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    @players = User.where(@team.team_role = 'true')
  end

  def create
    @user = User.new(user_params)
    if @player.save
      TeamRole.create(team_id: @team.id, user_id: @player.user.id, role: "player")
      flash[:notice] = "Player was created."
      redirect_to @team
    else
      flash[:error] = "There was an error creating the player. Please try again."
      render :new
    end
  end

  def show

  end

  def delete

  end

private

  def player_params
    params.require(:player).permit(:name, :email)
  end

end
