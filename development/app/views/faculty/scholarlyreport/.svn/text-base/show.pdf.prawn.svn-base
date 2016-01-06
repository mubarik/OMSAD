pdf.font "Helvetica"

pdf.text(@faculty_member.user.name, :size => 16, :style => :bold, :spacing => 4,:inline_format => true, :align => :center)
pdf.move_down(10)

pdf.text("Designation:", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
pdf.text(@faculty_member.designation, :size => 10,:spacing => 4,:inline_format => true)
pdf.move_down(5)
pdf.text("LUMS Email Id:", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
pdf.text(@faculty_member.user.email, :size => 10,:spacing => 4,:inline_format => true)
pdf.move_down(5)
pdf.text("Office Number:", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
pdf.text(@faculty_member.user.officenumber, :size => 10,:spacing => 4,:inline_format => true)
pdf.move_down(20)


if "#{@facultycourses.blank?}" == "false"
pdf.text("Course Information", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)
    data = [["Course Code","Course Name","Credit Hours","Semester", "Year","Number of students","Offering"]]
    @facultycourses.each do |item|
      data += [["#{item.course.blank?? "Not provided" :(item.course.coursecode)}","#{item.course.blank?? "Not provided" :(item.course.coursename)}","#{item.course.blank?? "Not provided" :(item.course.credithrs)}","#{item.semester.blank?? "Not provided" :(item.semester.offering)}","#{item.semester.blank?? "Not provided" :(item.semester.year)}","#{item.noofstudents}","#{item.offering}"]]
    end
    pdf.table(data) do |table|
        table.row(0).font_style = :bold
        table.row(0).size = 10
        table.rows(1..7).size = 10
    end
    pdf.move_down(20)
end

if "#{@inter_disciplinary_collaborations.blank?}" == "false"
    pdf.text("Inter disciplinary Collaboration", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)
    data=[["Name","Affiliation","Start Date","End Date","Description"]]
    @inter_disciplinary_collaborations.each do |item|
      data += [["#{item.name}","#{item.affiliation}","#{item.startdate}","#{item.enddate}","#{item.description}"]]
    end
    pdf.table(data) do |table|
        table.row(0).font_style = :bold
        table.row(0).size = 10
        table.rows(1..5).size = 10

    end
    pdf.move_down(20)
end

if "#{@faculty_publications.blank?}" == "false"
    pdf.text("Publications", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)
    data=[["Title","Url","Publication Status","Publication Type","Number of pages"]]
    @faculty_publications.each do |item|
      data += [["#{item.publication.title}","#{item.publication.doi.blank?? "Not provided" :(item.publication.doi)}","#{item.publication.publicationstatus}","#{item.publication.publication_type.name}","#{item.publication.pages.blank?? "Not provided" :(item.publication.pages)}"]]
    end
    pdf.table(data) do |table|
        table.row(0).font_style = :bold
        table.row(0).size = 10
        table.rows(1..5).size = 10

    end
    pdf.move_down(20)
end

if "#{@faculty_awards.blank?}" == "false"
    pdf.text("Honors, Awards and Fellowships", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)
    data=[["Title","Year"]]
    @faculty_awards.each do |item|
      data += [["#{item.title}","#{item.year}"]]
    end
    pdf.table(data) do |table|
       table.row(0).font_style = :bold
        table.row(0).size = 10
        table.rows(1..2).size = 10
        table.rows(1..2).width = 245
    end
    pdf.move_down(20)
end

if "#{@faculty_research_grants.blank?}" == "false"
    pdf.text("<u>Research Grants</u>", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)
    data=[["Principle Investigator","Department","Grant Number","Title","Amount","Funding Agency", "Start Date", "End Date"]]
    @faculty_research_grants.each do |item|
      data += [["#{item.pi_name}","#{item.faculty_member.blank?? "Not Provided" :(item.faculty_member.user.department.name)}","#{item.grantnumber}","#{item.title}","#{item.amount}","#{item.fundingagency}","#{item.startdate}","#{item.enddate}"]]
    end
    pdf.table(data) do |table|
        table.row(0).font_style = :bold
        table.row(0).size = 10
        table.rows(1..2).size = 10
    end
    pdf.move_down(20)
end


if "#{@phd_supervisions.blank?}" == "false"
    pdf.text("PhD Supervision", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)
    data=[["Roll No","Student Name","PhD Thesis Title","Proposal Submission Date","Thesis Defence Date"]]
    @phd_supervisions.each do |item|
      data += [["#{item.student.rollno}","#{item.student.user.name}","#{item.title}","#{item.proposalsubmission}","#{item.thesisdefence}"]]
    end
    pdf.table(data) do |table|
       table.row(0).font_style = :bold
       table.row(0).size = 10
       table.rows(1..3).size = 10
    end
    pdf.move_down(20)
end

if "#{@ms_thesis_supervisions.blank?}" == "false"
    pdf.text("MS Thesis Supervision", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)
    data=[["Roll No","Student Name","MS Thesis Title","Part 1 Year","Part 2 Year"]]
    @ms_thesis_supervisions.each do |item|
      data += [["#{item.student.rollno}","#{item.student.user.name}","#{item.title}","#{item.student_semester_part1.blank?? "Not Provided" :(item.student_semester_part1.semester.offering.to_s + " " + item.student_semester_part1.semester.year.to_s)}","#{item.student_semester_part2.blank?? "Not Provided" :(item.student_semester_part2.semester.offering.to_s + " " + item.student_semester_part2.semester.year.to_s)}"]]
    end
    pdf.table(data) do |table|
        table.row(0).font_style = :bold
        table.row(0).size = 10
        table.rows(1..5).size = 10
    end
    pdf.move_down(20)
end

if "#{@ms_project_supervisions.blank?}" == "false"
    pdf.text("MS Project Supervision", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)
    data=[["Roll No","Student Name","MS Project Title","Year","Proposal Defence Date"]]
    @ms_project_supervisions.each do |item|
      data += [["#{item.student.rollno}","#{item.student.user.name}","#{item.title}","#{item.student_semester_part1.blank?? "Not Provided" :(item.student_semester_part1.semester.offering.to_s + " " + item.student_semester_part1.semester.year.to_s)}","#{item.proposaldefencedate}"]]
    end
    pdf.table(data) do |table|
        table.row(0).font_style = :bold
        table.row(0).size = 10
        table.rows(1..5).size = 10
    end
    pdf.move_down(20)
end

if "#{@faculty_services.blank?}" == "false"
    pdf.text("Services", :size => 12, :style => :bold, :spacing => 4,:inline_format => true)
    pdf.move_down(5)

    @faculty_services.each do |item|
        if "#{item.year.blank?}" == "false"
            pdf.text("Year:", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
            pdf.text(item.year, :size => 10, :spacing => 4,:inline_format => true)
            pdf.move_down(5)
        end

        if "#{item.universityservices.blank?}" == "false"
            pdf.text("University Services:", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
            pdf.text(item.universityservices, :size => 10, :spacing => 4,:inline_format => true)
            pdf.move_down(5)
         end

        if "#{item.outsideservices.blank?}" == "false"
            pdf.text("Outside LUMS services:", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
            pdf.text(item.outsideservices, :size => 10, :spacing => 4,:inline_format => true)
            pdf.move_down(5)
        end

        if "#{item.advisoryroles.blank?}" == "false"
            pdf.text("Advisory Roles:", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
            pdf.text(item.advisoryroles, :size => 10, :spacing => 4,:inline_format => true)
            pdf.move_down(5)
         end

         if "#{item.statement.blank?}" == "false"
            pdf.text("Statement:", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
            pdf.text(item.statement, :size => 10, :spacing => 4,:inline_format => true)
        end
        pdf.move_down(10)
    end
end