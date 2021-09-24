require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'has many' do
    should have_many :room_messages
  end

  it 'accepts nested attributes for' do
    should accept_nested_attributes_for :room_messages
  end

  it 'belongs to' do
    should belong_to :user
    should belong_to :profile
  end
end
