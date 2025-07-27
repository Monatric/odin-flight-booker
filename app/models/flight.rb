class Flight < ApplicationRecord
  validates :start_date, presence: true, comparison: { greater_than: Time.now.next_day, less_than: 1.year.from_now }
  validates :flight_duration, presence: true, comparison: { greater_than: 59.minutes, less_than: 24.hours }

  has_many :bookings

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  scope :dates_asc, -> { select(:start_date).order(:start_date).distinct }
  scope :available_flights,
    ->(departure_airport_id, arrival_airport_id, start_date) {
        where(departure_airport_id: departure_airport_id)
        .where(arrival_airport_id: arrival_airport_id)
        .where(start_date: start_date)
      }

  def start_date_format_to_date
    start_date.to_date
  end

  def start_date_format_to_full_mdy
    start_date.strftime("%B %d, %Y")
  end
end
