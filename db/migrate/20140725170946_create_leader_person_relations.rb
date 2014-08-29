class CreateLeaderPersonRelations < ActiveRecord::Migration
  def change
    create_table :leader_person_relations do |t|
      t.integer :person_id
      t.integer :leader_id

      t.timestamps
    end
  end
end
