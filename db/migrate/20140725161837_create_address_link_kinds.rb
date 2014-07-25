class CreateAddressLinkKinds < ActiveRecord::Migration
  def change
    create_table :address_link_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
