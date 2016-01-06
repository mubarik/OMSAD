class ModifyStartEndDateConferencePublications < ActiveRecord::Migration
  def up
    change_column :conference_publications ,:conferencestartdate,:date
    change_column :conference_publications ,:conferenceenddate,:date
  end

  def down
    change_column :conference_publications ,:conferencestartdate,:datetime
    change_column :conference_publications ,:conferenceenddate,:datetime
  end
end
