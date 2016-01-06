class ModifyJournalPublication < ActiveRecord::Migration
  def up
    add_column :publications, :pages, :string
    change_column :journal_publications, :impactfactor , :float
    
  end

  def down
    remove_column :publications, :pages
    change_column :journal_publications, :impactfactor , :integer

  end
end
