class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
 
  has_many :event_attendings, foreign_key: :attendee_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
  
  scope :past_events, -> {where("date < ?", Time.now)}
  scope :future_events, -> {where("date > ?", Time.now)}

end
