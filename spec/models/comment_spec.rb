# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'validates body' do
    should validate_presence_of :body
  end

  it 'belongs to' do
    should belong_to :user
    should belong_to :post
  end
end
