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
    @zebra = Team.find(@match.away_team_id).team_name
  end

  def update
    #note: kick-off editing doesn't work
    @match = Match.find(params[:id])
    @team = Team.find(@match.away_team_id)

    #adding team scores
    params[:match][:home_team_score].to_i.times do
      Goal.create(match_id: @match.id, team_id: @match.home_team_id)
    end

    params[:match][:away_team_score].to_i.times do
      Goal.create(match_id: @match.id, team_id: @match.away_team_id)
    end

    # Delete Goal / Add scorer
    if @match.home_team_score != 0
      params[:match][:goals_attributes].each do |key, value|
        if value["_destroy"] == "1"
          Goal.destroy(value["id"].to_i)
        end
        goal = Goal.find(value["id"].to_i)
        goal.update_attribute(:user_id, value["user_id"].to_i)
      end
    end


    #ensuring we only update team name if a change has been made
      if @team.team_name != params[:match][:team_name]
      @team.update_attribute(:team_name , params[:match][:team_name])
      flash[:notice] = "Match was updated."
      redirect_to @match
    else
      flash[:error] = "There was an error saving the match details. Please try again."
      render :show
    end
  end

  def update_score
    @match = Match.find(params[:id])
    
  end

   private

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :kick_off, :home_team_score, :away_team_score, goal_attributes: [:id, :team_id, :match_id, :user_id] )
  end
end
