class ModifyConferencePublicationsReference < ActiveRecord::Migration
  def up
    add_column :conference_publications , :reference , :string
    add_column :conference_publications , :referenceweb , :string
  end

  def down
    remove_column :conference_publications , :reference
    remove_column :conference_publications , :referenceweb
  end
end
