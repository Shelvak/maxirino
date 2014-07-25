class CreateAddressConceptualizationRelations < ActiveRecord::Migration
  def change
    create_table :address_conceptualization_relations do |t|
      t.integer :address_id
      t.integer :conceptualization_id

      t.timestamps
    end
  end
end
