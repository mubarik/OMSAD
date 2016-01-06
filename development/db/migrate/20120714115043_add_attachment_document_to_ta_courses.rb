class AddAttachmentDocumentToTaCourses < ActiveRecord::Migration
  def self.up
    change_table :ta_courses do |t|
      t.has_attached_file :document
    end
  end

  def self.down
    drop_attached_file :ta_courses, :document
  end
end
