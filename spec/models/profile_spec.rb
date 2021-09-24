require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'validates first_name' do
    should validate_length_of :first_name
  end

  it 'validates second_name' do
    should validate_length_of :second_name
  end

  it 'validates locate' do
    should validate_length_of :locate
  end

  it 'has many' do
    should have_many :posts
    should have_many :rooms
  end

  it 'belongs to' do
    should belong_to :user
  end

  it 'has one attached' do
    should have_one_attached :avatar
  end
end
