require 'rails_helper'

RSpec.describe Invitation, type: :model do

  it 'belongs to' do
    should belong_to :user
  end

end
