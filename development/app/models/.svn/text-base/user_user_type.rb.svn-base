class UserUserType < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_type

  def self.add_user(usertype_id,user_id)
    UserUserType.create(:user_type_id => usertype_id, :user_id =>user_id)
  end

  def self.delete_user(user_id)
    user_record = UserUserType.find_by_user_id(user_id)
    user_record.destroy
  end
end
