require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #let(:users) { create_list :user, 3 } #work
  let(:user) { FactoryBot.create(:user)}

  before do
    sign_in user
  end

  it "redirect when something went wrong" do
    get :index#work
    expect(response).to render_template("index")
  end

  #work
  # context 'GET #index' do
  #   before do
  #     @users = [FactoryBot.build_stubbed(:user)]
  #     allow(User).to receive(:all).and_return(@users)
  #     binding.pry
  #     get :index
  #   end
  #
  #   it 'returns users' do
  #     is_expected.to render_template :index
  #     expect(assigns(:users)).to match_array(@users)
  #   end
  # end
  context 'GET #index' do
    before { get :index }

    it 'returns users' do
      is_expected.to render_template :index
      expect(assigns(:users)).to match_array(user)
    end
  end

  context 'GET #show' do
    let(:params) { { id: user.id } }
    before { get :show, params: params }
    it 'show item' do
      is_expected.to render_template :show
      expect(assigns(:user)).eql? user
    end
  end

end