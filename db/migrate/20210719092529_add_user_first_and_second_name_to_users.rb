class AddUserFirstAndSecondNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_first_name, :string
    add_column :users, :user_second_name, :string
  end
end
