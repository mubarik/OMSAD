class ModifyPublicationTable < ActiveRecord::Migration
  def up
    add_column :publications, :doi, :string
    remove_column :publications, :affiliation
  end

  def down
    add_column :publications, :affiliation, :boolean
    remove_column :publications, :doi
  end
end
