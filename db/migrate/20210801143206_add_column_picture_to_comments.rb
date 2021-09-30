# frozen_string_literal: true

class AddColumnPictureToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :picture, :string
  end
end
