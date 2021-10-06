# frozen_string_literal: true

class FixColumnsToInterest < ActiveRecord::Migration[6.1]
  def change
    rename_column :interests, :type, :title
    remove_column :interests, :user_id
    add_column :interests, :category_id, :integer
  end
end
