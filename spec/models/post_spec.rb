# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'validates content' do
    should validate_presence_of :content
  end

  it 'validates heading' do
    should validate_presence_of :heading
  end

  it 'has many' do
    should have_many :comments
    should have_many :likes
  end

  it 'belongs to' do
    should belong_to :user
    should belong_to :profile
  end
end
