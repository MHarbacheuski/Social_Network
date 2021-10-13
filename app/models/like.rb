# frozen_string_literal: true

class Like < ApplicationRecord
  include PublicActivity::Common

  belongs_to :post
  belongs_to :user
end
