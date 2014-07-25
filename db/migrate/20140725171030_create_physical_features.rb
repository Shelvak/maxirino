class CreatePhysicalFeatures < ActiveRecord::Migration
  def change
    create_table :physical_features do |t|
      t.string :name

      t.timestamps
    end
  end
end
