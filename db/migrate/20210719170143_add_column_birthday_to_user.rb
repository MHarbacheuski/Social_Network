# frozen_string_literal: true

class AddColumnBirthdayToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :date
  end
end
