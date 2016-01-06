class AddAttachmentSemesterexceptionToStudentSemesters < ActiveRecord::Migration
  def self.up
    change_table :student_semesters do |t|
      t.has_attached_file :semesterexception
    end
  end

  def self.down
    drop_attached_file :student_semesters, :semesterexception
  end
end
