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
    #Handle an incoming `` params `` that contains a away_team_name,
    # that doesn't necessarily match up with any team in the database.
    #You will have to create a team with it.

    #away_team_name = params.delete[:away_team_name]
   
    #>> params
    # Team.create(....)

    #away_team_score
    #create x number of goals based on away_team_score and home_team_score
   
    @away_team = Team.create(team_name: params[:match][:away_team_id])
     
   kick_off = DateTime.new(params[:match]["kick_off(1i)"].to_i,
                          params[:match]["kick_off(2i)"].to_i,
                          params[:match]["kick_off(3i)"].to_i,
                          params[:match]["kick_off(4i)"].to_i,
                          params[:match]["kick_off(5i)"].to_i,
                          params[:match]["kick_off(6i)"].to_i)
   
    @match = Match.new(home_team_id: params[:match][:home_team_id], 
                        away_team_id: @away_team.id, kick_off: kick_off)  
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
    params.require(:match).permit(:home_team_id, :away_team_id, :kick_off)
  end
end
