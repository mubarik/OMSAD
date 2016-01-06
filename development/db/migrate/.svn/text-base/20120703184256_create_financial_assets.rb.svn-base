class CreateFinancialAssets < ActiveRecord::Migration
  def change
    create_table :financial_assets do |t|
      t.integer :financial_aid_id
      t.string :asset_file_name
      t.string :asset_content_type
      t.string :asset_file_size
      t.datetime :asset_updated_at

      t.timestamps
    end
  end
end
