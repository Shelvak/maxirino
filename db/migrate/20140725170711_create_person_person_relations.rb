class CreatePersonPersonRelations < ActiveRecord::Migration
  def change
    create_table :person_person_relations do |t|
      t.integer :person_1_id
      t.integer :person_2_id
      t.integer :link_type_id
      t.date :since_date
      t.date :until_date

      t.timestamps
    end
  end
end
