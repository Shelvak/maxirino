class CreatePersonQuadrantLinkKinds < ActiveRecord::Migration
  def change
    create_table :person_quadrant_link_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
