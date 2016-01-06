class CreateUserResearchGrants < ActiveRecord::Migration
  def change
    create_table :user_research_grants do |t|
      
      t.integer :user_id
      t.integer :researchgrant_id
      t.string  :teammembername
      t.string  :designation
      t.boolean :lumsaffiliation
      t.string  :affiliation

      t.timestamps
    end
  end
end
