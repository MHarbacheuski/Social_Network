# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  # let(:users) { create_list :user, 3 } #work
  let(:profile) { create :profile }

  let(:profile_params) do
    {
      profile: {
        first_name: Faker::Name.first_name,
        second_name: Faker::Name.last_name,
        locate: Faker::Address.city,
        birthday: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
        avatar: nil
      }
    }
  end

  it 'redirect when something went wrong' do
    get :index # work
    expect(response).to render_template('index')
  end

  context 'GET #index' do
    before { get :index }

    it 'returns profiles' do
      is_expected.to render_template :index
      expect(assigns(:profiles)).to match_array(profile)
    end
  end

  context 'PUT #update' do
    subject { put :update, params: profile_params }

    it 'save the item' do
      binding.pry
      expect { subject }.to change(Profile, :count)
    end

    it 'redirect_to index' do
      expect(subject).to redirect_to action: :index
    end

    context 'with invalid params' do
      let(:profile_params) do
        { profile: { firs_name: -20 } }
      end
      it 'dosn`t save' do
        expect { subject }.to_not change(Profile, :count)
        is_expected.to render_template :edit
      end
    end
  end

  context 'GET #show' do
    let(:params) { { id: profile.id } }
    before { get :show, params: params }
    it 'show item' do
      is_expected.to render_template :show
      expect(assigns(:profile)).eql? profile
    end
  end
end
