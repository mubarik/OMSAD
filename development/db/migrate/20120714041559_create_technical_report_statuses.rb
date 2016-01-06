class CreateTechnicalReportStatuses < ActiveRecord::Migration
  def change
    create_table :technical_report_statuses do |t|
      t.string :name
      t.timestamps
    end
  end
end
