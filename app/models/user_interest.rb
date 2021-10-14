# frozen_string_literal: true

class UserInterest < ApplicationRecord
  include PublicActivity::Common

  belongs_to :user
  belongs_to :interest
end
