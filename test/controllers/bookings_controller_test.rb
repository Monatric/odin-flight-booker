require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    flight = flights(:one)
    get new_booking_url(flight_id: flight)
    assert_response :success
  end
end
