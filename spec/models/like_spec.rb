# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'belongs to' do
    should belong_to :user
    should belong_to :post
  end
end
