pdf.font "Helvetica"
if "#{@facultymember.user.photo}" != "/photos/original/missing.png"
    @start, @end = ("#{@facultymember.user.photo}").split('?')
    prawn_logo = "#{Rails.public_path}"+@start
    pdf.image prawn_logo, :at => [350,720], :width => 100, :height=>90
end
pdf.text "#{@facultymember.user.name}", :size => 25, :style => :bold, :spacing => 4
pdf.move_down(10)
pdf.text "Email: #{@facultymember.user.email}", :spacing => 16
pdf.text "Address: #{@facultymember.user.address}", :spacing => 16
pdf.text "Tel: #{@facultymember.user.officenumber}", :spacing => 16
pdf.text "Mob: #{@facultymember.user.officenumber}", :spacing => 16
pdf.move_down(20)

#pdf.fill_color "0000ff"

if "#{@facultymember.job_experiences.blank?}" == "false"
pdf.text("<u>Job Experience</u>", :size => 16, :style => :bold, :spacing => 4,:inline_format => true)
pdf.move_down(5)
data=[["Organization","Designation","From","To"]]
@facultymember.job_experiences.each do |item|
  data += [["#{item.organizationname}","#{item.designation}","#{item.from_year}","#{item.to_year}"]]
end
pdf.table(data) do |table|
    table.row(0).font_style = :bold
    table.rows(1..4).width = 120
end
pdf.move_down(10)
end

if "#{@facultymember.awards_information.blank?}" == "false"
pdf.text("<u>Honors, Awards and Fellowship</u>", :size => 16, :style => :bold, :spacing => 4,:inline_format => true)
pdf.move_down(5)
data=[["Title","Year"]]
@facultymember.awards_information.each do |item|
  data += [["#{item.title}","#{item.year}"]]
end
pdf.table(data) do |table|
    table.row(0).font_style = :bold
    table.rows(1..2).width = 240
end
pdf.move_down(10)
end

if "#{@facultymember.educational_information.blank?}" == "false"
pdf.text("<u>Educational Information</u>", :size => 16, :style => :bold, :spacing => 4,:inline_format => true)
pdf.move_down(5)
data=[["Degree","University","Year"]]
@facultymember.educational_information.each do |item|
  data += [["#{item.degree}","#{item.university}","#{item.year}"]]
end
pdf.table(data) do |table|
    table.row(0).font_style = :bold
    table.rows(1..3).width = 160
end 
pdf.move_down(10)
end

if "#{@facultymember.researchinterests.blank?}" == "false"
pdf.text("<u>Research Interests</u>", :size => 16, :style => :bold, :spacing => 4,:inline_format => true)
pdf.move_down(5)
pdf.text "#{@facultymember.researchinterests}", :spacing => 16, :align=>:justify
pdf.move_down(10)
end

if "#{@facultymember.biography.blank?}" == "false"
pdf.text("<u>Biography</u>", :size => 16, :style => :bold, :spacing => 4,:inline_format => true)
pdf.move_down(5)
pdf.text "#{@facultymember.biography}", :spacing => 16, :align=>:justify
pdf.move_down(10)
end

if "#{@facultymember.inter_disciplinary_collaborators.blank?}" == "false"
pdf.text("<u>Inter-Disciplinary Collaboration</u>", :size => 16, :style => :bold, :spacing => 4,:inline_format => true)
pdf.move_down(5)
data=[["Name","Affiliation","Start","End","Description"]]
@facultymember.inter_disciplinary_collaborators.each do |item|
  data += [["#{item.name}","#{item.affiliation}","#{item.startdate}","#{item.enddate}","#{item.description}"]]
end
pdf.table(data) do |table|
    table.row(0).font_style = :bold
    table.rows(1..4).width = 95
end
pdf.move_down(10)
end

#pdf.text("<u>Services</u>", :size => 16, :style => :bold, :spacing => 4,:inline_format => true)
#pdf.move_down(5)
#data=[["University Services","Outside LUMS Services","Advisory Role","Future Plans","Year"]]
#@facultymember.services.each do |item|
#  data += [["#{item.universityservices}","#{item.outsideservices}","#{item.advisoryroles}","#{item.statement}","#{item.year}"]]
#end
#pdf.table(data) do |table|
#    table.row(0).font_style = :bold
#end
#pdf.move_down(10)

if "#{@facultymember.user.user_publications.blank?}" == "false"
    pdf.text("<u>Publications</u>", :size => 16, :style => :bold, :spacing => 4,:inline_format => true)
    if "#{@facultymember.user.book_publications.blank?}" == "false"
        pdf.move_down(5)
        pdf.text("Books", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
        pdf.move_down(5)
        serial_no = 1
        @facultymember.user.book_publications.each do |item|
            authors_list = ""
            item.user_publications.each do |author|
              authors_list +=  author.authorname + " , "
            end
            pdf.text("#{item.publicationyear} , <b>#{item.title}</b> , Authors #{authors_list} , <i>#{item.book_publication.publishername} Press, #{item.pages} Pages</i> , #{item.doi.blank?? '' :'link to my book'+ item.doi}" , :size => 10, :spacing => 4,:inline_format => true)
            serial_no = serial_no + 1
            pdf.move_down(5)
        end
        pdf.move_down(5)
    end

    if "#{@facultymember.user.book_chapter_publications.blank?}" == "false"
        pdf.text("Book chapters", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
        pdf.move_down(5)
        serial_no = 1
        @facultymember.user.book_chapter_publications.each do |item|
            authors_list = ""
            item.user_publications.each do |author|
              authors_list +=  author.authorname + " , "
            end
            pdf.text("#{item.publicationyear} , <b>#{item.title}</b> , Authors: #{authors_list} <i>#{item.book_chapter_publication.bookname} , #{item.book_chapter_publication.publishername} Press , #{item.doi.blank?? '' :'link to my book'+ item.doi}</i>" , :size => 10, :spacing => 4,:inline_format => true)
            serial_no = serial_no + 1
            pdf.move_down(5)
        end
        pdf.move_down(5)
    end

    if "#{@facultymember.user.journal_publications.blank?}" == "false"
        pdf.text("Journal Papers", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
        pdf.move_down(5)
        serial_no = 1
        @facultymember.user.journal_publications.each do |item|
            authors_list = ""
            item.user_publications.each do |author|
              authors_list +=  author.authorname + " , "
            end
            pdf.text("#{authors_list} <b>#{item.title}</b> , <i>#{item.journal_publication.journalname} , #{item.journal_publication.volume} , #{item.publicationyear}</i>" , :size => 10, :spacing => 4,:inline_format => true)
            serial_no = serial_no + 1
            pdf.move_down(5)
        end
        pdf.move_down(5)
    end

    if "#{@facultymember.user.conference_publications.blank?}" == "false"
        pdf.text("Conference Papers", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
        pdf.move_down(5)
        serial_no = 1
        @facultymember.user.conference_publications.each do |item|
            authors_list = ""
            item.user_publications.each do |author|
              authors_list +=  author.authorname + " , "
            end
            pdf.text("#{authors_list} <b>#{item.title}</b> , <i>In Proceedings Of International Conference On #{item.conference_publication.conferencename} , #{item.conference_publication.city}, #{item.publicationyear}</i>" , :size => 10, :spacing => 4,:inline_format => true)
            serial_no = serial_no + 1
            pdf.move_down(5)
        end
        pdf.move_down(5)
    end

    if "#{@facultymember.user.workshop_publications.blank?}" == "false"
        pdf.text("Workshop Papers", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
        pdf.move_down(5)
        serial_no = 1
        @facultymember.user.workshop_publications.each do |item|
            authors_list = ""
            item.user_publications.each do |author|
              authors_list +=  author.authorname + " , "
            end
            pdf.text("#{authors_list} <b>#{item.title}</b> , <i>In Proceedings Of International workshop #{item.workshop_publication.workshopname} and Conference #{item.workshop_publication.conferencename} , #{item.workshop_publication.city}, #{item.publicationyear}</i>" , :size => 10, :spacing => 4,:inline_format => true)
            serial_no = serial_no + 1
            pdf.move_down(5)
        end
        pdf.move_down(5)
    end

    if "#{@facultymember.user.technicalreport_publications.blank?}" == "false"
        pdf.text("Technical Reports", :size => 10, :style => :bold, :spacing => 4,:inline_format => true)
        pdf.move_down(5)
        serial_no = 1
        @facultymember.user.technicalreport_publications.each do |item|
            authors_list = ""
            item.user_publications.each do |author|
              authors_list +=  author.authorname + " , "
            end
            pdf.text("#{authors_list} <b>#{item.title}</b> , <i>#{item.technical_report_publication.technicalreportnumber} , #{item.publicationyear}, Pages #{item.pages}</i>" , :size => 10, :spacing => 4,:inline_format => true)
            serial_no = serial_no + 1
            pdf.move_down(5)
        end
        pdf.move_down(5)
    end
end
