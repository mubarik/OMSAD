class TaCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :semester
  belongs_to :course

  validates :evalgpa, :numericality =>{:greater_than => -0.0000001, :less_than => 4.0001, :message => "Must be between 0 and 4.0"} , :allow_nil => true,  :length => {:maximum => 4, :message => "GPA must have 2 decimal digits"}

  has_attached_file :document
  validates_attachment_content_type :document,
                                    :content_type => ['application/msword','application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']


  def self.get_semester_courses(user_id,semester_id)
    @ta_added_courses = TaCourse.select(:course_id).where(:semester_id => semester_id, :user_id => user_id)

    @ta_courses = Array.new
    @ta_courses.push(0)
    @ta_added_courses.each do |semester_course|
      @ta_courses.push(semester_course.course_id)
    end
    @semestercourses = SemesterCourse.find(:all, :conditions => ["semester_id =? AND course_id NOT IN (?)", semester_id, @ta_courses])
    return @semestercourses
  end
end
