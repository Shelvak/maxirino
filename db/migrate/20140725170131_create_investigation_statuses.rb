class CreateInvestigationStatuses < ActiveRecord::Migration
  def change
    create_table :investigation_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
