# frozen_string_literal: true

class DeleteColumnNameToRoom < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :name
  end
end
