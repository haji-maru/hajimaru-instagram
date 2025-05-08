require 'rails_helper'

RSpec.describe 'Api::Unfollows', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST /api/unfollows' do
    context 'フォローを解除した場合' do

      before do
        user.follow!(other_user.id)
      end

      it 'follower_count が1減る' do
        expect { post api_unfollow_path(account_id: other_user.id) }.to change { other_user.follower_count }.by(-1)
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body['status']).to eq('ok')
        expect(body['follower_count']).to eq(0) # userがフォロー解除
        expect(body['following_count']).to eq(0)
      end
    end
  end
end
