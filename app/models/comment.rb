# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  mount_uploader :picture, PictureUploader

  validates :body, presence: true
end
