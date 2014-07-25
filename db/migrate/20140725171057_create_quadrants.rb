class CreateQuadrants < ActiveRecord::Migration
  def change
    create_table :quadrants do |t|
      t.string :name

      t.timestamps
    end
  end
end
