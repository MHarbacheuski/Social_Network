require 'rails_helper'

RSpec.describe Interest, type: :model do
  it 'validates title' do
    should validate_presence_of :title
  end

  it 'has many' do
    should have_many :user_interests
    should have_many :users
  end

  it 'belongs to' do
    should belong_to :category
  end
end
