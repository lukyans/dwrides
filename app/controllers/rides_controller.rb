class RidesController < ApplicationController
  def index
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.save
    # if ride.save
    #   flash[:success] = "Welcome to the Sample App!"
    #   redirect_to root_path
    # else
  end

private

  def ride_params
    params.require(:ride).permit(:id, :airport, :flight_number, :traveling_status, :spot, :date)
  end
end
