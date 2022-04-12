class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new(event_params)
  end

  def create
    @event = current_user.hosted_events.build(event_params)

    if @event.save
      redirect_to @event
      flash[:notice] = 'Event successfully created.'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
