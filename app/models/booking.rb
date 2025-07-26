class Booking < ApplicationRecord
  validates :num_tickets, presence: true, numericality: { greater_than: 0, less_than: 5 }

  has_many :passengers
  belongs_to :flight
end
