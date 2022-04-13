class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :event_attendees, through: :attendances

  def self.past
    where('date < ?', Date.today)
  end

  def self.upcoming
    where('date >= ?', Date.today)
  end
end
