class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @rides = current_user.rides #if user_signed_in?
  end

  def new
    @ride = Ride.new
  end

  def show
    
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    if @ride.save
      flash[:success] = "Ride has been requested."
      redirect_to rides_path
    else
      render :new
    end
  end

  def requested
    @rides = current_user.rides if user_signed_in?
    @drives = Drive.all
  end

  def offered

  end

private

  def ride_params
    params.require(:ride).permit(:event, :airport, :flight_number, :traveling_status, :spot, :date, :time)
  end
end
