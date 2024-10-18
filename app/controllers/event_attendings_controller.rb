class EventAttendingsController < ApplicationController
  def create
    @event_attending = EventAttending.new(perm_event_attending_params)

    if @event_attending.save
      flash[:success] = "Your participation at this event is confirmed."
      redirect_to event_path(:attended_event_id)
    else
      flash.now[:error].now = "Your request was not correctly process. Please try again or contact the support."
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_attending = EventAttending.find(params[:id])
    @event_attending.destroy

    redirect_to event_path(@event), status: :see_other
  end

  private

  def perm_event_attending_params
    params.require(:event_attending).permit(:attended_event_id, :event_attendee_id)
  end
end
