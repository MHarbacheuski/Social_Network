# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many' do
    should have_many :user_interests
    should have_many :interests
    should have_many :posts
    should have_many :comments
    should have_many :invitations
    should have_many :pending_invitations
    should have_many :likes
    should have_many :rooms
    should have_many :room_messages
  end

  it 'has one' do
    should have_one :profile
  end

  it 'has one attached' do
    should have_one_attached :avatar
  end

  it { should accept_nested_attributes_for :profile }
end
