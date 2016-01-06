class CreateWorkshopPublications < ActiveRecord::Migration
  def change
    create_table :workshop_publications do |t|
      t.integer :publication_id
      t.string :workshopname
      t.datetime :acceptancedate
      t.string :conferencename
      t.string :website
      t.datetime :workshopstartdate
      t.datetime :workshopenddate
      t.string :city
      t.timestamps
    end
  end
end
