class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      redirect_to @attendance.attended_event
      flash[:notice] = 'You are now attending this event'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Something went wrong'
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id, :event_attendee_id)
  end
end
