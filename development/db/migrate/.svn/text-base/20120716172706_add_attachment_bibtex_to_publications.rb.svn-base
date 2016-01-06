class AddAttachmentBibtexToPublications < ActiveRecord::Migration
  def self.up
    change_table :publications do |t|
      t.has_attached_file :bibtex
    end
  end

  def self.down
    drop_attached_file :publications, :bibtex
  end
end
