class Flight < ApplicationRecord
  validates :start_date, presence: true, comparison: { greater_than: Time.now.next_day, less_than: 1.year.from_now }
  validates :flight_duration, presence: true, comparison: { greater_than: 1.hour, less_than: 24.hours }

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
end
