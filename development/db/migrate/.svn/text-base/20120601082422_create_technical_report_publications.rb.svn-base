class CreateTechnicalReportPublications < ActiveRecord::Migration
  def change
    create_table :technical_report_publications do |t|
      t.integer :publication_id
      t.string :technicalreportnumber
      t.integer :department_id # will be attched to the department table
      t.timestamps
    end
  end
end
