class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  accepts_nested_attributes_for :room_messages, allow_destroy: true
  belongs_to :user
  belongs_to :profile
end
