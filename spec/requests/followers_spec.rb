require 'rails_helper'

RSpec.describe 'Followers', type: :request do
  let!(:user) { create(:user) }
  let!(:follower1) { create(:user) }
  let!(:follower2) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /followers' do
    context 'フォロワーページを選択した場合' do
      it '200ステータスが返ってくる' do
        get account_follower_path(user)
        expect(response).to have_http_status(200)
      end
    end

    before do
      follower1.follow!(user)
      follower2.follow!(user)
    end

    context 'ユーザーがフォローされている場合' do
      it 'フォロワーの一覧が表示できる' do
        get account_follower_path(user)
        expect(response).to have_http_status(200)
        expect(response.body).to include(follower1.username)
        expect(response.body).to include(follower2.username)
      end
    end
  end
end
