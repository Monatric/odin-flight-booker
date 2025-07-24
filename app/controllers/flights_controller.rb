class FlightsController < ApplicationController
  def index
    @departure_airports = Flight.all.map { |f| [ f.departure_airport.code, f.departure_airport.code ] }
    @arrival_airports = Flight.all.map { |f| [ f.arrival_airport.code, f.arrival_airport.code ] }
    @flight_dates = Flight.dates_asc
    @num_tickets = 4.times.map { |n| [ n + 1, n + 1 ] }

    departure_code = Airport.find_by(code: params[:departure_code])
    arrival_code = Airport.find_by(code: params[:arrival_code])
    start_date = params[:start_date].to_date.all_day
    @flights = Flight.available_flights(departure_code, arrival_code, start_date)
  end
end
