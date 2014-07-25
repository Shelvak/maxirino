class CreatePeopleRelationKinds < ActiveRecord::Migration
  def change
    create_table :people_relation_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
