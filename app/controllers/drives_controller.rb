class DrivesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_drive, only: [:show, :edit, :update, :destroy, :requested, :reserve, :cancel]

  def index
    @drives = current_user.drives
  end

  def new
    @drive = Drive.new
  end

  def show
  end

  def edit
  end

  def create
    @drive = Drive.new(drive_params)
    @drive.user = current_user
    if @drive.save
      flash[:success] = "Ride has been offered."
      redirect_to drives_path
    else
      render :new
    end
  end

  def update
    if @drive.update(drive_params)
      flash[:notice] = "Ride was successfully updated."
      redirect_to drive_path(@drive)
    end
  end

  def destroy
    @drive.destroy
    flash[:notice] = "Ride was successfully deleted."
    redirect_to drives_path
  end

  def requested
    @requested_rides = @drive.rides.available
  end

  def reserve
    ride = params[:ride]
    @drive.reserve!
    if @drive.reserved?
      redirect_to available_ride_path(ride)
      flash[:notice] = "Ride reserved!"
    else
      redirect_to available_ride_path(ride)
      flash[:notice] =  "Sorry could not reserve a ride."
    end
  end

  def cancel
    ride = params[:ride]
    @drive.cancel!
    if @drive.canceled?
      redirect_to available_ride_path(ride)
      flash[:notice] = "Ride canceled!"
    else
      redirect_to available_ride_path(ride)
      flash[:notice] =  "Sorry could not cancel a ride."
    end
  end

private

  def set_drive
    @drive = Drive.find(params[:id])
  end

  def drive_params
    params.require(:drive).permit(:event_id, :airport, :spot, :date, :time)
  end
end
