class FlightsController < ApplicationController
  def index
    @departure_airports = Flight.all.map { |f| [ f.departure_airport.code, f.departure_airport.code ] }
    @arrival_airports = Flight.all.map { |f| [ f.arrival_airport.code, f.arrival_airport.code ] }
    @flight_dates = Flight.dates_asc
    @num_tickets = 4.times.map { |n| [ n + 1, n + 1 ] }
  end
end
