class CreateInvestigationCategories < ActiveRecord::Migration
  def change
    create_table :investigation_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
