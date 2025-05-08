require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, :with_avatar, user: user) }

  before do
    sign_in user
  end

  describe 'GET /profile' do
    context 'プロフィールページに遷移した場合' do
      it '200ステータスが返ってくる' do
        get profile_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'PATCH /profile' do
    context 'プロフィール画像を更新した場合' do
      let!(:image_path) { Rails.root.join('app/assets/images/back-icon.png') }
      let!(:avatar_file) { fixture_file_upload(image_path, 'image/png') }

      it '200ステータスが返ってくる、ステータス・メッセージ・URLが返ってくる' do
        patch profile_path, params: { profile: { avatar: avatar_file } }
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body['status']).to eq ('ok')
        expect(body['message']).to eq ('更新できました')
        expect(body['avatar_url']).to include('back-icon.png')
      end
    end
  end

  describe 'PATCH /profile' do
    context 'プロフィール画像の更新に失敗した場合' do
      let!(:invalid_file_path) { Rails.root.join('app/assets/images/invalid.txt') }
      let!(:invalid_file) { fixture_file_upload(invalid_file_path, 'text/plain') }

      it '422ステータスとエラーメッセージを返す' do
        patch profile_path, params: { profile: { avatar: invalid_file } }

        expect(response).to have_http_status(:unprocessable_entity)

        body = JSON.parse(response.body)
        expect(body['status']).to eq('error')
        expect(body['message']).to eq('更新できませんでした')
        expect(body['errors']).to be_an(Array)
        expect(body['errors']).not_to be_empty
      end
    end
  end
end
