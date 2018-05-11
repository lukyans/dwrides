class DrivesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @drives = current_user.drives if user_signed_in?
  end

  def new
    @drive = Drive.new
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

  def needed
    @drives = current_user.drives if user_signed_in?
    @rides = Ride.all
  end

  def offered
    @drives = current_user.drives if user_signed_in?
    @rides = Ride.all
  end

private

  def drive_params
    params.require(:drive).permit(:airport, :spot, :date, :time)
  end
end
