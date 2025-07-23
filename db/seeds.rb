# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Airport seeds
AIRPORT_CODES = %w[SFO LAX JFK ORD DFW MIA MNL CEB CRK HND CDG DXB]

AIRPORT_CODES.each do |code|
  Airport.find_or_create_by!(code: code)
end

p "Seeded #{Airport.count} airport codes"

# Flight seeds
FLIGHTS = [
  {
    departure_airport_id: 1,
    arrival_airport_id: 2,
    start_date: DateTime.new(2025, 8, 10, 18, 00, 0),
    flight_duration: 3.hours
  },
  {
    departure_airport_id: 12,
    arrival_airport_id: 5,
    start_date: DateTime.new(2025, 8, 5, 8, 30, 0),
    flight_duration: 2.hours + 45.minutes
  },
  {
    departure_airport_id: 7,
    arrival_airport_id: 6,
    start_date: DateTime.new(2025, 8, 8, 15, 15, 0),
    flight_duration: 7.hours
  },
  {
    departure_airport_id: 3,
    arrival_airport_id: 10,
    start_date: DateTime.new(2025, 9, 1, 0, 0, 0),
    flight_duration: 5.hours + 30.minutes
  },
  {
    departure_airport_id: 3,
    arrival_airport_id: 9,
    start_date: DateTime.new(2025, 8, 12, 1, 30, 0),
    flight_duration: 50.minutes
  },
  {
    departure_airport_id: 9,
    arrival_airport_id: 5,
    start_date: DateTime.new(2025, 7, 25, 9, 0, 0),
    flight_duration: 12.hours
  },
  {
    departure_airport_id: 11,
    arrival_airport_id: 2,
    start_date: DateTime.new(2025, 12, 1, 12, 30, 0),
    flight_duration: 10.hours
  },
  {
    departure_airport_id: 10,
    arrival_airport_id: 7,
    start_date: DateTime.new(2026, 2, 14, 3, 30, 0),
    flight_duration: 6.hours + 30.minutes
  }
]

FLIGHTS.each do |flight|
  Flight.find_or_create_by!(
    departure_airport_id: flight[:departure_airport_id],
    arrival_airport_id: flight[:arrival_airport_id],
    start_date: flight[:start_date],
    flight_duration: flight[:flight_duration]
  )
end

p "Seeded #{Flight.count} flights"
