class CreateInvestigationPersonRelations < ActiveRecord::Migration
  def change
    create_table :investigation_person_relations do |t|
      t.integer :investigation_id
      t.integer :person_id

      t.timestamps
    end
  end
end
