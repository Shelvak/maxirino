class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :person_id
      t.string :phone
      t.string :details

      t.timestamps
    end
  end
end
