class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.references :departure_airport, null: false, foreign_key: true
      t.references :arrival_airport, null: false, foreign_key: true
      t.datetime :start_date
      t.time :flight_duration

      t.timestamps
    end
  end
end
