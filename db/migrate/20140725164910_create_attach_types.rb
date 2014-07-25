class CreateAttachTypes < ActiveRecord::Migration
  def change
    create_table :attach_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
