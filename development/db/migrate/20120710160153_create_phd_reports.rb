class CreatePhdReports < ActiveRecord::Migration
  def change
    create_table :phd_reports do |t|
      t.integer :milestone_id
      t.string :reportname
      t.string :reporttype
      t.string :reportstatus
      t.date :reportdate

      t.timestamps
    end
  end
end
