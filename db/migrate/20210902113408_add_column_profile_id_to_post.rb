# frozen_string_literal: true

class AddColumnProfileIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :profile_id, :integer
  end
end
