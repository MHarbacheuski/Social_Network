class Comment < ApplicationRecord
  validates :text_comment, presence: true
  belongs_to :user
  belongs_to :post
  mount_uploader :picture, PictureUploader
end
