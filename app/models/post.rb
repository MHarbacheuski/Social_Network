# frozen_string_literal: true

class Post < ApplicationRecord
  searchkick
  Post.reindex

  belongs_to :user
  belongs_to :profile

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :content, presence: true
  validates :heading, presence: true

  def search_data
    {
      content: content,
      heading: heading
    }
  end
end
