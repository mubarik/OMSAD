class AddAttachmentCvToFacultyMembers < ActiveRecord::Migration
  def self.up
    change_table :faculty_members do |t|
      t.has_attached_file :cv
    end
  end

  def self.down
    drop_attached_file :faculty_members, :cv
  end
end
