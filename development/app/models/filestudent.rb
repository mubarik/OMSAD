class Filestudent < ActiveRecord::Base
     def self.importstudent(csv)
    n=0

     CSV.foreach(csv, :headers => "true")  do |row|
       c=Filestudent.new
      c.name=row[0]
      c.dob=row[1]
      c.gender=row[2]
      c.department=row[3]
      c.address=row[4]
      c.contactno=row[5]
      c.email=row[6]
      c.usertype=row[7]
      c.rollno=row[8]
      c.credithrs=row[9]
      c.financialaid=row[10]
      c.cgpa=row[11]
      c.degreelevel=row[12]
      c.probation=row[13]
      c.currentstatus=row[14]
      c.admission=row[15]
  
   
        if c.save
        #n=n+1
        GC.start if n%50==0
        end

      end
      Filestudent.studentsave

      return n
  end

   def self.studentsave

     
     @temp = Filestudent.all
     (@temp).each do |s|
       @department = Department.find_by_name(s.department)
       if @department.nil? || @department.blank?
         @deparment = Department.create(:school_id=> 1, :name => s.department, :project_conf_id => 1)
         @department = Department.find_by_name(s.department)
       else
         @department = Department.find_by_name(s.department)
       end
       @student = Student.find_by_rollno(s.rollno)
       @probationstatus = StudentProbationStatusType.find_by_name(s.probation)
       if @probationstatus.nil?
         @probationstatus =     StudentProbationStatusType.create(:name => s.probation, :project_conf_id => 1 )
       end
       @degreestatus = StudentDegreeStatusType.find_by_name(s.currentstatus)
       if @degreestatus.nil?
         @degreestatus = StudentDegreeStatusType.create(:name => s.currentstatus, :project_conf_id => 1 )
       end
     if @student.nil?
       @user = User.create(:name => s.name,:dateofbirth => s.dob,:department_id => @department.id ,  :gender => s.gender, :address => s.address, :contactnumber => s.contactno, :email=> s.email)
         @usertype = UserUserType.create(:user_id => @user.id, :user_type_id => 2 )
         @studentsave =  Student.create(:user_id => @user.id, :rollno => s.rollno,:credithrstaken => s.credithrs,
           :financialaidstatus => s.financialaid, :cgpa => s.cgpa, :degreelevel => s.degreelevel, :student_probation_status_type_id =>  @probationstatus.id,
            :student_degree_status_type_id => @degreestatus.id , :admissiondate => s.admission)
             
            
     end
     end
     
    end


end
     
