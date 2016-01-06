class ModifyTaCourse < ActiveRecord::Migration
  def up
    add_column     :ta_courses , :evalgpa ,:float
    rename_column     :ta_courses ,:t_assistant_id, :user_id
  end

  def down
    change_column     :ta_courses, :user_id , :t_assistant_id
  end
end
