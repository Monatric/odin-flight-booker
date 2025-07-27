class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def create
  end
end
