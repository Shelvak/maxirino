class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :father
      t.string :mother
      t.text :notes
      t.string :record
      t.boolean :sex
      t.string :alias

      t.timestamps
    end
  end
end
