class ModifyUsersTable < ActiveRecord::Migration
  def up

    add_column :users, :secondaryemail , :string
    add_column :users, :officenumber , :string

  end

  def down

    remove_column :users, :secondaryemail
    remove_column :users, :officenumber

  end
end
