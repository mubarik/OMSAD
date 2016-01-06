class ModifyTAssistant < ActiveRecord::Migration
  def up
    change_column :t_assistants, :description , :text
    add_column :t_assistants, :evalgpa , :float
  end

  def down
    change_column :t_assistants, :description
  end
end
