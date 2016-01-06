class TechnicalReportPublication < ActiveRecord::Base
  belongs_to :publication
  belongs_to :department

#  validates :technicalreportnumber,:presence => { :message => "Technical report number is required." }
#            :numericality => true
  validates :department_id ,
            :presence => { :message => "Department name is required."}

  def self.all_wrappers
    technicalreport_publications = TechnicalReportPublication.all
    technicalreport_publication_wrappers = Array.new
    technicalreport_publications.each do|technicalreport_publication|

       technicalreport_publication_wrapper = IndexWrapper.new( technicalreport_publication.publication.id,
                                                            'displayPic',
                                                            'penguin.jpg',
                                                            technicalreport_publication.publication.title,
#                                                            'Author',technicalreport_publication.publication.faculty_member.user.name ,
                                                            'Publication Year',technicalreport_publication.publication.publicationyear,
#                                                            'Department',technicalreport_publication.publication.faculty_member.user.department.name,
                                                            'faculty/technicalreportpublications')

      technicalreport_publication_wrappers.push(technicalreport_publication_wrapper)
    end

    return technicalreport_publication_wrappers.reverse
  end

end
