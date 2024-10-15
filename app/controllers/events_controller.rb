class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(perm_event_params)

    @event.build_creator(id: current_user.id)

    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def perm_event_params
    params.require(:event).permit(:name, :date, :location)
  end
end
