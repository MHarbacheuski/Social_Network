require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'validates text_comment' do
    should validate_presence_of :text_comment
  end

  it 'mount uploader' do

  end

  it 'belongs to' do
    should belong_to :user
    should belong_to :post
  end
end
