class CreateCourseAssets < ActiveRecord::Migration
  def change
    create_table :course_assets do |t|
      t.integer :student_course_id
      t.string :asset_file_name
      t.string :asset_content_type
      t.string :asset_file_size
      t.datetime :asset_updated_at

      t.timestamps
    end
  end
end
