class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hosted_events, foreign_key: 'host_id', class_name: 'Event', inverse_of: 'host'
  has_many :attendances, foreign_key: 'event_attendee_id'
  has_many :attended_events, through: :attendances
end
