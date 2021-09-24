require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'validates name' do
    should validate_presence_of :name
  end

  it 'has many' do
    should have_many :interests
  end
end
