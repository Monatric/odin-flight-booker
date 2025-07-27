class Booking < ApplicationRecord
  validates :num_tickets, presence: true, numericality: { greater_than: 0, less_than: 5 }

  has_many :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers
  belongs_to :flight, inverse_of: :bookings
end
