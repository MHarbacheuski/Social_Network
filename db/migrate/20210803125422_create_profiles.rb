# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :second_name
      t.string :locate
      t.date :birthday
      t.binary :avatar
      t.timestamps
    end
  end
end
