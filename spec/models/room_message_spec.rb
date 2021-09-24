require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  it 'belongs to' do
    should belong_to :room
    should belong_to :user
  end
end
