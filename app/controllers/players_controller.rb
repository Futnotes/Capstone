class PlayersController < ApplicationController


  def index
    @players = User.where(role_on_team(@team) == true).all
  end

  def new
    @player = User.new
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

  def show

  end

  def delete

  end

private

  def player_params
    params.require(:user).permit(:name, :email)
  end

end
