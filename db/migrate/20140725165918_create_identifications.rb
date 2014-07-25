class CreateIdentifications < ActiveRecord::Migration
  def change
    create_table :identifications do |t|
      t.string :number
      t.integer :person_id
      t.integer :identification_type_id

      t.timestamps
    end
  end
end
