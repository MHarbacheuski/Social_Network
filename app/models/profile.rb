class Profile < ApplicationRecord
  validates :first_name, length: { maximum: 15 }
  validates :second_name, length: { maximum: 30 }
  validates :locate, length: { maximum: 40 }

  has_many :posts
  has_many :rooms
  belongs_to :user

  has_one_attached :avatar
  #searchkick
  def avatar_attachment_path
    avatar.attached? ? avatar : 'default-user.jpg'
  end
end
