class DrivesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @drive = Drive.new
  end

  def create
    @drive = Drive.new(drive_params)
    @drive.user = current_user
    if @drive.save
      flash[:success] = "Ride has been offered."
      redirect_to root_path
    else
      render :new
    end
  end

private

  def drive_params
    params.require(:drive).permit(:airport, :spot, :date)
  end
end
