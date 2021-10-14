# frozen_string_literal: true

class Interest < ApplicationRecord
  include PublicActivity::Common

  belongs_to :category

  has_many :user_interests, dependent: :destroy
  has_many :users, through: :user_interests

  validates :title, presence: true
end
