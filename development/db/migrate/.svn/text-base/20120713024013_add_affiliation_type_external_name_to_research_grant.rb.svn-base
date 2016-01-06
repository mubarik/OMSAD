class AddAffiliationTypeExternalNameToResearchGrant < ActiveRecord::Migration

  def up
    add_column :research_grants ,:pi_affiliation_type,:boolean ,:default=>true
    add_column :research_grants ,:external_pi_name ,:string
    add_column :research_grants ,:external_pi_affiliation ,:string
  end
  def down
    remove_column :research_grants ,:pi_affiliation_type
    remove_column :research_grants ,:external_pi_name
    remove_column :research_grants ,:external_pi_affiliation
  end
end

