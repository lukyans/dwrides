class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
      if @event.save(:validate => false)
      flash[:success] = "Event has been added."
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :airport, :date)
  end
end
