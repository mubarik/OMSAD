class AddFianancialAidStatusToFianancialAids < ActiveRecord::Migration
  def up
    add_column :financial_aids ,:financial_aid_status_type_id,:integer,:default=>1
    remove_column :financial_aids,:status
  end

  def down
    remove_column :financial_aids,:financial_aid_status_type_id
    add_column :financial_aids,:status,:string
  end
end
