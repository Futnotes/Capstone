class MatchesController < ApplicationController


  def index
    #needs to be filtered at the view level to only show team, user matches.
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:notice] = "Match was created."
      redirect_to @match
    else
      flash[:error] = "There was an error creating the match. Please try again."
      render :new
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(match_params)
      flash[:notice] = "Match was updated."
      redirect_to @match
    else
      flash[:error] = "There was an error saving the match details. Please try again."
      render :edit
    end
  end

   private

  def match_params
    params.require(:match).permit(:team_id, :team_two_name, :kick_off)
  end
end
