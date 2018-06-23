class RidesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_ride, only: [:show, :edit, :update, :destroy, :available]

  def index
    @rides = current_user.rides
  end

  def new
    @ride = Ride.new
  end

  def show
  end

  def edit
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

  def update
    if @ride.update(ride_params)
      flash[:notice] = "Ride was successfully updated."
      redirect_to ride_path(@ride)
    end
  end

  def destroy
    @ride.destroy
    flash[:notice] = "Ride was successfully deleted."
    redirect_to rides_path
  end

  def available
    @available_rides = @ride.drives
  end

private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params
    params.require(:ride).permit(:event_id, :airport, :flight_number, :traveling_status, :spot, :date, :time)
  end
end
