class CreateActionZonePersonRelations < ActiveRecord::Migration
  def change
    create_table :action_zone_person_relations do |t|
      t.integer :person_id
      t.integer :action_zone_id

      t.timestamps
    end
  end
end
