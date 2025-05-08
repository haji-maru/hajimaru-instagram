require 'rails_helper'

RSpec.describe 'Api::Follows', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /api/follows' do
    context 'フォローされていない状態でプロフィールページにアクセスした場合' do
      it 'hasFollowed が false となる' do
        get api_follow_path(account_id: other_user.id)
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body['hasFollowed']).to eq(false)
      end
    end
  end

  describe 'GET /api/follows' do
    context 'フォローされてる状態でプロフィールページにアクセスした場合' do

      before do
        user.follow!(other_user.id)
      end

      it 'hasFollowed が true となる' do
        get api_follow_path(account_id: other_user.id)
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body['hasFollowed']).to eq(true)
      end
    end
  end
end
