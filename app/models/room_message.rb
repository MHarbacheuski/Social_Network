class RoomMessage < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def as_json(options)
    super(options)
  end
end
