require 'rails_helper'

RSpec.describe 'Accounts', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  before do
    sign_in user
  end

  context '他のユーザーページに遷移した場合' do
    describe 'GET /accounts' do
      it '200ステータスが返ってくる' do
        get account_path(other_user)
        expect(response).to have_http_status(200)
      end
    end
  end

  context '自分のアカウントページに遷移した場合' do
    describe 'GET /accounts' do
      it 'profileページにリダイレクトされる' do
        get account_path(user)
        expect(response).to have_http_status(302)
      end
    end
  end
end
