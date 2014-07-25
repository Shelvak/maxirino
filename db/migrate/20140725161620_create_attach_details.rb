class CreateAttachDetails < ActiveRecord::Migration
  def change
    create_table :attach_details do |t|
      t.string :from
      t.text :details
      t.integer :attach_id

      t.timestamps
    end
  end
end
