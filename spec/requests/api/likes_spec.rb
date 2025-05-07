require 'rails_helper'

RSpec.describe 'Api::Likes', type: :request do
  let!(:user) { create(:user) }
  let!(:test_post) { create(:post, :with_images, user: user) }

  before do
    sign_in user
  end

  describe 'GET /api/likes' do
    context 'いいねされている場合' do
      let!(:like) { create(:like, user: user, post: test_post) }
      it 'hasLiked: trueが返ってくる' do
        get api_like_path(post_id: test_post.id)
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body['hasLiked']).to eq (true)
        expect(body['like_count']).to eq (1)
      end
    end

    context 'いいねされていない場合' do
      it 'hasLiked: trueが返ってくる' do
        get api_like_path(post_id: test_post.id)
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body['hasLiked']).to eq (false)
        expect(body['like_count']).to eq (0)
      end
    end
  end
end
