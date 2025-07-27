class Passenger < ApplicationRecord
  validates :name, presence: true, length: { in: 3..100 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :email, presence: true

  belongs_to :booking, inverse_of: :passengers
end
