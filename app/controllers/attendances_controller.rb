class AttendancesController < ApplicationController
  def create
    @attended_event = Event.find(attendance_params[:attended_event_id])
    @attendance = current_user.attendances.create(attended_event_id: @attended_event.id)
    if @attendance.save
      redirect_to @attended_event
      flash[:notice] = 'You are now attending this event'
    else
      redirect_to root
      flash[:alert] = 'Something went wrong'
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id)
  end
end
