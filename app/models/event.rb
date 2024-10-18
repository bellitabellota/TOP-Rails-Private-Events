class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee

  # def self.upcoming
  #   Event.where("date >= ?", Date.current)
  # end

  # def self.past
  #   Event.where("date < ?", Date.current)
  # end

  scope :upcoming, -> { where("date >= ?", DateTime.current) }

  scope :past, -> { where("date < ?", DateTime.current) }
end
