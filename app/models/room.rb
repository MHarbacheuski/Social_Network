# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  has_many :room_messages, dependent: :destroy

  accepts_nested_attributes_for :room_messages, allow_destroy: true
end
