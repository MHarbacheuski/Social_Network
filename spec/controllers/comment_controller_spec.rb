# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:comments) { create_list :comment, 3 } # work
  let(:comment_params) do
    {
      comment: {
        text_comment: Faker::Subscription.plan,
        picture: nil,
        user_id: 2
      }.merge(post_id: 4)
    }
  end

  context 'POST #create' do
    subject { post :create, params: comment_params }

    # it 'returns comments' do
    #   binding.pry
    #   expect(assigns(:comments)).to match_array(comments)
    # end

    it 'save the item' do
      # binding.pry
      expect { subject }.to change(Comment, :count).by 1
    end

    it 'redirect_to index' do
      expect(subject).to redirect_to action: :index
    end

    context 'with invalid params' do
      let(:comment_params) do
        { comment: { text_comment: -20 } }
      end
      it 'dosnt save' do
        expect { subject }.to_not change(Comment, :count)
        is_expected.to render_template :new
      end
    end
  end
end
