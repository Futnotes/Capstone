class AvailabilitiesController < ApplicationController

  def new
    @availability = Availability.new
  end

  def create

    @availability = Availability.new(availability_params)
    
    @match = :match

     if @availability.save!
      flash[:notice] = "Player was created."
      redirect_to @availability.match
    else
      flash[:error] = "There was an error creating the player. Please try again."
      render :new
    end
  end

  private

  def availability_params
    params.require(:availability).permit(:user_id, :match_id)
  end

end


