class AvailabilitiesController < ApplicationController

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)

    @availability.save!
    redirect_to @availability.match
  end

  def destroy
    @availability = Availability.find(params[:id]) 
    @availability.destroy
    redirect_to :back
  end

  private

  def availability_params
    params.require(:availability).permit(:user_id, :match_id)
  end

end


