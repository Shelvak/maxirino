class CreatePersonPhysicalFeatures < ActiveRecord::Migration
  def change
    create_table :person_physical_features do |t|
      t.integer :person_id
      t.integer :physical_feature_id

      t.timestamps
    end
  end
end
