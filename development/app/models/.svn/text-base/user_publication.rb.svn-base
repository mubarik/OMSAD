class UserPublication < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication

  alias_attribute :external_entity_name , :authorname
  alias_attribute :affiliationtype , :lumsaffiliation
  alias_attribute :affiliationname , :affiliation

  before_destroy :check_author_index

  def check_author_index

    i=0;
    if !self.publication.blank?

      for author in self.publication.user_publications
        if (author.id != self.id)
          i+=1
          author.update_attribute(:authorindex,i)
        end
      end
    end
  end
end
