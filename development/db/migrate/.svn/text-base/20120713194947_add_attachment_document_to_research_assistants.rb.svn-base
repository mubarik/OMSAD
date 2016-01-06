class AddAttachmentDocumentToResearchAssistants < ActiveRecord::Migration
  def self.up
    change_table :research_assistants do |t|
      t.has_attached_file :document
    end
  end

  def self.down
    drop_attached_file :research_assistants, :document
  end
end
