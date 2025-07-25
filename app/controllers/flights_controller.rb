class FlightsController < ApplicationController
  def index
    @airports = Airport.pluck(:code, :code)
    # @flight_dates = Flight.dates_asc.pluck(:start_date).map(&:to_date).uniq.map { |d| [ d.strftime("%B %d, %Y"), d ] }
    @flight_dates = Flight.pluck(Arel.sql("DISTINCT DATE(start_date)")).sort.map { |d| [ d.strftime("%B %d, %Y"), d ] }
    @num_tickets = 4.times.map { |n| [ n + 1, n + 1 ] }
    @search = flight_search_params

    @flights = available_flights
  end

  private

    def available_flights
      departure_code = Airport.find_by(code: @search[:departure_code])
      arrival_code = Airport.find_by(code: @search[:arrival_code])
      start_date = @search[:start_date].to_date.all_day if @search[:start_date].present?
      Flight.available_flights(departure_code, arrival_code, start_date)
    end

    def flight_search_params
      params.permit(:departure_code, :arrival_code, :start_date, :num_tickets)
    end
end
