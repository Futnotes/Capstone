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
    puts "---------- Params passed to controller: #{params} ------------"
    @availability = Availability.where(user_id: current_user.id, match_id: params[:match_id]).first.delete
    redirect_to :back
  end

  private

  def availability_params
    params.require(:availability).permit(:user_id, :match_id)
  end

end


