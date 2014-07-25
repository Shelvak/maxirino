class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :address_type_id
      t.string :number
      t.string :between
      t.string :street
      t.text :notes

      t.timestamps
    end
  end
end
