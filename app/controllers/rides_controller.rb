class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    if @ride.save
      flash[:success] = "Ride has been requested."
      redirect_to root_path
    else
      render :new
    end
  end

private

  def ride_params
    params.require(:ride).permit(:airport, :flight_number, :traveling_status, :spot, :date)
  end
end
