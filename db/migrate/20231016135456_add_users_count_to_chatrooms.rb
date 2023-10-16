class AddUsersCountToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :users_count, :integer
  end
end
