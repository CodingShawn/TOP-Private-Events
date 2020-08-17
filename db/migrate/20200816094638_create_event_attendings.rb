class CreateEventAttendings < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendings do |t|
      t.references :event_attendee
      t.references :attendee_event

      t.timestamps
    end
  end

  add_foreign_key :event_attendings, :users, column: :event_attendee_id
  add_foreign_key :event_attendings, :events, column: :attendee_event_id
end
