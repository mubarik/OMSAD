class CreateResearchGrants < ActiveRecord::Migration
  def change
    create_table :research_grants do |t|
      t.string :title
      t.string :grantnumber
      t.text :description
      t.string :fundingagency
      t.datetime :startdate
      t.datetime :enddate
      t.integer :amount
      t.integer :faculty_member_id
      t.text :partners #universities
      t.text :team
      t.timestamps
    end
  end
end
