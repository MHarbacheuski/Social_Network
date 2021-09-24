class Post < ApplicationRecord
  validates :content, presence: true
  validates :heading, presence: true

  belongs_to :user
  belongs_to :profile
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :picture, PictureUploader
  #searchkick
end
