class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.save
    redirect_to root_url
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def attend
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    @event.save
    redirect_to root_url
  end

  private
  def event_params
    params.require(:event).permit(:name, :date)
  end
end
