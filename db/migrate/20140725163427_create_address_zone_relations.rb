class CreateAddressZoneRelations < ActiveRecord::Migration
  def change
    create_table :address_zone_relations do |t|
      t.integer :address_id
      t.integer :zone_id

      t.timestamps
    end
  end
end
