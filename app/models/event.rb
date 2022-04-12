class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :event_attendees, through: :attendances
end
