class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.date = DateTime.current
    @event.save
    redirect_to root_url
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end
