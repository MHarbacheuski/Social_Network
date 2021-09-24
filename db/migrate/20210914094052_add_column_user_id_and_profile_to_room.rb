class AddColumnUserIdAndProfileToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :user_id, :integer
    add_column :rooms, :profile_id, :integer
  end
end
