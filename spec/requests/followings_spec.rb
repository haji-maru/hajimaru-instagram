require 'rails_helper'

RSpec.describe 'Followings', type: :request do
  let!(:user) { create(:user) }
  let!(:following1) { create(:user) }
  let!(:following2) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /followings' do
    context 'フォロイングページを選択した場合' do
      it '200ステータスが返ってくる' do
        get account_following_path(user)
        expect(response).to have_http_status(200)
      end
    end

    before do
      user.follow!(following1)
      user.follow!(following2)
    end

    context 'ユーザーがフォローしている場合' do
      it 'フォローしているユーザーの一覧が表示できる' do
        get account_following_path(user)
        expect(response).to have_http_status(200)
        expect(response.body).to include(following1.username)
        expect(response.body).to include(following2.username)
      end
    end
  end
end
