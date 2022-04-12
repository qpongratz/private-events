class AddIndexToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_index :attendances, [:attended_event_id, :event_attendee_id], unique: true
  end
end
