class CreateConceptualizations < ActiveRecord::Migration
  def change
    create_table :conceptualizations do |t|
      t.string :name

      t.timestamps
    end
  end
end
