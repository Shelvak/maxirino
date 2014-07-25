class CreateInvestigations < ActiveRecord::Migration
  def change
    create_table :investigations do |t|
      t.integer :investigation_status_id
      t.integer :category_id
      t.date :start_date
      t.date :end_date
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
