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
  { dep: "SFO", arr: "LAX", dt: DateTime.new(2025, 8, 10, 18,  0,  0), dur: 3.hours },
  { dep: "LAX", arr: "JFK", dt: DateTime.new(2025, 8,  5,  8, 30,  0), dur: 2.hours + 45.minutes },
  { dep: "MNL", arr: "CEB", dt: DateTime.new(2025, 8,  8, 15, 15,  0), dur: 1.hour + 20.minutes },
  { dep: "JFK", arr: "ORD", dt: DateTime.new(2025, 9,  1,  0,  0,  0), dur: 5.hours + 30.minutes },
  { dep: "MIA", arr: "DFW", dt: DateTime.new(2025, 8, 12,  1, 30,  0), dur: 2.hours + 45.minutes },
  { dep: "CDG", arr: "DXB", dt: DateTime.new(2025, 8, 13, 20, 30,  0), dur: 6.hours + 50.minutes },
  { dep: "DXB", arr: "HND", dt: DateTime.new(2025, 8, 14,  2, 15,  0), dur: 9.hours + 40.minutes },
  { dep: "CEB", arr: "CRK", dt: DateTime.new(2025, 8, 14, 18, 30,  0), dur: 1.hour + 5.minutes },
  { dep: "CRK", arr: "ORD", dt: DateTime.new(2025, 12, 24, 23,  0,  0), dur: 15.hours + 30.minutes },
  { dep: "CRK", arr: "ORD", dt: DateTime.new(2025, 12, 24, 15,  15,  0), dur: 1.hour },
  { dep: "CRK", arr: "ORD", dt: DateTime.new(2025, 12, 24, 8,  45,  0), dur: 2.hours },
  { dep: "MNL", arr: "CEB", dt: DateTime.new(2025, 8, 8, 10,  0,  0), dur: 2.hours + 10.minutes },
  { dep: "CRK", arr: "JFK", dt: DateTime.new(2025, 12, 24, 23,  0,  0), dur: 1.hour }
]

FLIGHTS.each do |flight|
  depature_airport = Airport.find_by(code: flight[:dep])
  arrival_airport = Airport.find_by(code: flight[:arr])

  Flight.find_or_create_by!(
    departure_airport: depature_airport,
    arrival_airport: arrival_airport,
    start_date: flight[:dt],
    flight_duration: flight[:dur]
  )
end

p "Seeded #{Flight.count} flights"
