class ModifyPublicationDetails < ActiveRecord::Migration
  def up
    rename_column :publications , :publicationtype_id ,:publication_type_id

    remove_column :publications , :researcharea
    remove_column :publications , :publicationdate
    remove_column :publications , :publicationstatustype_id

    add_column    :publications  , :publicationyear , :string
    add_column    :publications , :publicationstatus , :string
    add_column    :publications , :faculty_member_id , :integer
    add_column    :publications , :keywords , :text
    
    #shows whether the publication was done when the author was in LUMS or not.
    add_column    :publications , :affiliation ,:boolean
  end

  def down
    rename_column :publications , :publication_type_id ,:publicationtype_id

    add_column :publications , :researcharea , :string
    add_column :publications , :publicationdate , :datetime
    add_column :publications , :publicationstatustype_id , :integer

    remove_column    :publications  , :publicationyear
    remove_column    :publications , :publicationstatus
    remove_column    :publications , :faculty_member_id
    remove_column    :publications , :keywords
    #shows whether the publication was done when the author was in LUMS or not.
    remove_column    :publications , :affiliation
  end
end
