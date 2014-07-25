class CreateInvestigationAddressRelations < ActiveRecord::Migration
  def change
    create_table :investigation_address_relations do |t|
      t.integer :address_id
      t.integer :investigation_id

      t.timestamps
    end
  end
end
