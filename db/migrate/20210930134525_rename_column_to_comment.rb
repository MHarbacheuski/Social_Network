# frozen_string_literal: true

class RenameColumnToComment < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :text_comment, :body
  end
end
