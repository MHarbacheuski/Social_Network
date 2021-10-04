# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  render_views

  let!(:user) { create :user }
  let!(:profile) { create :profile }
  let!(:post) { create :post }
  let!(:posts) { create_list :post, 5, user: user }
  let!(:params) { { id: profile.id } }

  let!(:post_params) do
    {
      post: {
        content: Faker::Subscription.plan,
        picture: nil,
        heading: Faker::Subscription.plan,
        user_id: user.id,
        profile_id: profile.id
      }
    }
  end


  it 'redirect when something went wrong' do
    get :index # work
    expect(response).to render_template('index')
  end

  it 'GET #index' do
    get :index
    it 'returns posts' do
      is_expected.to render_template :index
      expect(assigns(:posts)).to match_array([post])
    end
  end

  context 'POST #create' do
    subject { post :create, params: post_params }

    it 'save the post' do
      expect { subject }.to change { Post.count }.by(1)
    end

    it 'redirect_to index' do
      expect(subject).to redirect_to action: :index
    end

    context 'with invalid params' do
      let(:post_params) do
        { post: { content: -20 } }
      end
      it 'dosnt save' do
        expect { subject }.to_not change(Post, :count)
        is_expected.to render_template :new
      end
    end
  end
end
