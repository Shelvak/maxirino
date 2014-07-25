class CreateActionZones < ActiveRecord::Migration
  def change
    create_table :action_zones do |t|
      t.string :name

      t.timestamps
    end
  end
end
