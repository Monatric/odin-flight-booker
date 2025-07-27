class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "Flight booked successfully!"
    else
      flash.now[:alert] = "Flight cannot be booked."
      render :new, status: :unprocessable_entity
    end
  end

  private

    def booking_params
      params.expect(booking: [ :num_tickets, :flight_id, passengers_attributes: [ [ :id, :name, :email ] ] ])
    end
end
