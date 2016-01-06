class ModifyJournalPublications < ActiveRecord::Migration
  def up
     rename_column :journal_publications , :name ,:journalname
     add_column :journal_publications , :volume, :string
     add_column :journal_publications , :impactfactor ,:integer
  end

  def down
     rename_column :journal_publications , :journalname ,:name
     remove_column :journal_publications , :volume
     remove_column :journal_publications , :impactfactor
  end
end
