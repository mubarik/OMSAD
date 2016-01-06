class Publication < ActiveRecord::Base
  belongs_to :publication_type

  #all the publication types derive from Publication
  #in the db a foreign key from the publication table is present in this table
  has_one :journal_publication,:dependent=>:destroy
  accepts_nested_attributes_for :journal_publication,:allow_destroy => true
  has_one :conference_publication,:dependent=>:destroy
  accepts_nested_attributes_for :conference_publication,:allow_destroy => true
  has_one :technical_report_publication,:dependent=>:destroy
  accepts_nested_attributes_for :technical_report_publication,:allow_destroy => true
  has_one :workshop_publication,:dependent=>:destroy
  accepts_nested_attributes_for :workshop_publication,:allow_destroy => true
  has_one :book_publication,:dependent=>:destroy
  accepts_nested_attributes_for :book_publication,:allow_destroy => true
  has_one :book_chapter_publication,:dependent=>:destroy
  accepts_nested_attributes_for :book_chapter_publication,:allow_destroy => true

  #many to many association with the co_authors
  has_many :user_publications ,:dependent => :destroy,:order=>"authorindex ASC"
  accepts_nested_attributes_for :user_publications,
                                           :reject_if=> lambda{|a| a[:external_entity_name].blank? and a[:user_id].blank?} ,
                                           :allow_destroy => true
  
  has_many :users , :through => :user_publications

  #one to many association with publication photos
  has_many :publication_photos,:dependent=>:destroy
  accepts_nested_attributes_for :publication_photos,
                                :reject_if=> lambda{|a| a[:image].blank?} ,
                                :allow_destroy => true
  #one to one association for author-publication
  belongs_to :faculty_member

  has_attached_file :bibtex , :less_than => 5.megabytes
   validates_attachment_content_type :bibtex,
                                     :content_type => 'text/x-bibtex'
                                    

  validates :title , :presence => { :message => "Title cannot be blank"} ,
            :length=>{:maximum => 250}
#            :format => { :with => /^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$/, :message => "Title cannot have special characters"}

  
  validates :doi ,:allow_blank => true,
            :format => {:with => %r{( https?:// | www\. )[^\s<]+}x}

  validates :pages ,:allow_blank => true,
            :format => {:with =>/^\d+(--\d+)*$/,:message => "Must be in Range 1-2000"}

 def get_controller
      if publication_type_id == 1
        controllerstr = 'faculty/workshoppublications'
      elsif publication_type_id == 2
        controllerstr = 'faculty/journalpublications'
      elsif publication_type_id == 3
        controllerstr = 'faculty/conferencepublications'
      elsif publication_type_id == 4
        controllerstr = 'faculty/technicalreportpublications'
      elsif publication_type_id == 5
        controllerstr = 'faculty/bookchapterpublications'
      elsif publication_type_id == 6
        controllerstr = 'faculty/bookpublications'
      end
    return controllerstr
  end

end
