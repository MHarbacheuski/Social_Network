# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { create :user }
  let!(:post) { create :post }
  let!(:posts) { create_list :post, 5 }
  let!(:comment) { create :comment }
  let!(:comments) { create_list :comment, 5 }

  let!(:comment_params) do
    {
      comment: {
        body: Faker::Subscription.plan,
        picture: nil,
        user_id: user.id,
        comment_id: comment.id
      }.merge(post_id: post.id)
    }
  end

  context 'POST #create' do
    subject(:name) { post :create, comment_params }

    it 'save the comment' do
      expect { name }.to change { Comment.count }.by(1)
    end

    it 'redirect_to index' do
      expect(subject).to redirect_to action: :index
    end

    context 'with invalid params' do
      let(:comment_params) do
        { comment: { body: -20 } }
      end
      it 'dosnt save' do
        expect { subject }.to_not change(Comment, :count)
        is_expected.to render_template :new
      end
    end
  end
end
