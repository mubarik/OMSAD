class CreateConferencePublications < ActiveRecord::Migration
  def change
    create_table :conference_publications do |t|
      t.integer :publication_id
      t.string :conferencename
      t.datetime :acceptancedate
      t.string :website
      t.string :rank                  #a number
      t.datetime :conferencestartdate #day and month
      t.datetime :conferenceenddate   #day and month
      t.string :city
      t.timestamps
    end
  end
end
