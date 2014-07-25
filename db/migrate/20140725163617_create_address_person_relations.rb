class CreateAddressPersonRelations < ActiveRecord::Migration
  def change
    create_table :address_person_relations do |t|
      t.integer :person_id
      t.integer :address_id
      t.integer :address_link_kind_id

      t.timestamps
    end
  end
end
