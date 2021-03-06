# frozen_string_literal: true

class CreateInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :interests do |t|
      t.string :type
      t.integer :user_id
      t.timestamps
    end
  end
end
