# frozen_string_literal: true

class DeleteColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :avatar
    remove_column :users, :birthday
    remove_column :users, :bio
    remove_column :users, :first_name
    remove_column :users, :second_name
    remove_column :users, :username
    remove_column :users, :admin
    remove_column :users, :location
  end
end
