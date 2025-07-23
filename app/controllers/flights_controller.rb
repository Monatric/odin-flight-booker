class FlightsController < ApplicationController
  def index
    @departure_airports = Flight.all.map { |flight| [ flight.departure_airport.code, flight.departure_airport.id ] }
    @arrival_airports = Flight.all.map { |flight| [ flight.arrival_airport.code, flight.arrival_airport.id ] }
  end
end
