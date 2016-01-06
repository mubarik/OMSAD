class ModifyJournalPublicationsReference < ActiveRecord::Migration
  def up
    add_column :journal_publications , :year , :string
    add_column :journal_publications , :reference , :string
    add_column :journal_publications , :referenceweb , :string
  end

  def down
    remove_column :journal_publications , :year
    remove_column :journal_publications , :reference
    remove_column :journal_publications , :referenceweb
  end
end
