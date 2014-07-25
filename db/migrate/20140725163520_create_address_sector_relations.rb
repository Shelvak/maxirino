class CreateAddressSectorRelations < ActiveRecord::Migration
  def change
    create_table :address_sector_relations do |t|
      t.integer :address_id
      t.integer :sector_id
      t.integer :percentage
      t.string :detail

      t.timestamps
    end
  end
end
