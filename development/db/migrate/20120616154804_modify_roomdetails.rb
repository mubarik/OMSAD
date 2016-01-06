class ModifyRoomdetails < ActiveRecord::Migration
  def up
    add_column  :room_details , :roomname , :string
  end

  def down
  end
end
