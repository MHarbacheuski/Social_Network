# frozen_string_literal: true

class Profile < ApplicationRecord
  searchkick
  Profile.reindex

  belongs_to :user

  has_many :posts, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_one_attached :avatar

  validates :first_name, length: { maximum: 15 }
  validates :second_name, length: { maximum: 30 }
  validates :locate, length: { maximum: 40 }

  def avatar_attachment_path
    avatar.attached? ? avatar : 'default-user.jpg'
  end

  def search_data
    {
      first_name: first_name,
      second_name: second_name
    }
  end
end
