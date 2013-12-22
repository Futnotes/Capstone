class PlayersController < ApplicationController

  def index
    @players = User.all
  end

  def new
    @player = User.new
  end

  def create
    @player = User.new(player_params)
    if @player.save
      TeamRole.create(team_id: @team.id, user_id: @player.id, role: "player")
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
    params.require(:user).permit(:name, :email)
  end

end
