class CreatePersonAddresses < ActiveRecord::Migration
  def change
    create_table :person_addresses do |t|
      t.integer :person_id
      t.integer :address_id
      t.integer :country_id
      t.integer :province_id
      t.integer :city_id
      t.integer :zone_id
      t.string :street_name
      t.string :street_number

      t.timestamps
    end
  end
end
