class CreateConceptualizationPersonRelations < ActiveRecord::Migration
  def change
    create_table :conceptualization_person_relations do |t|
      t.integer :person_id
      t.integer :conceptualization_id

      t.timestamps
    end
  end
end
