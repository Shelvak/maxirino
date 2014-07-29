class CreateAttaches < ActiveRecord::Migration
  def change
    create_table :attaches do |t|
      t.integer :attach_type_id
      t.string :file
      t.string :title
      t.integer :person_id

      t.timestamps
    end
  end
end
