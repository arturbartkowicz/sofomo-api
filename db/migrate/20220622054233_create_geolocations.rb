class CreateGeolocations < ActiveRecord::Migration[5.2]
  def change
    create_table :geolocations do |t|
      t.string :ip_address
      t.string :location

      t.timestamps
    end
  end
end
