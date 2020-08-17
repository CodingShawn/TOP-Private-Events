class User < ApplicationRecord
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
      
  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendings, source: :attendee_event

  def upcoming_events
      self.attended_events.filter do |event|
      event_date = event.date
      event_date.future?
    end
  end

  def past_events
      self.attended_events.filter do |event|
      event_date = event.date
      event_date.past?
    end
  end
end
