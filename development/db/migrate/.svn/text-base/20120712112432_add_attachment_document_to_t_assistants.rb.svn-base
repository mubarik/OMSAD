class AddAttachmentDocumentToTAssistants < ActiveRecord::Migration
  def self.up
    change_table :t_assistants do |t|
      t.has_attached_file :document
    end
  end

  def self.down
    drop_attached_file :t_assistants, :document
  end
end
