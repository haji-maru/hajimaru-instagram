require 'rails_helper'

RSpec.describe 'Api::Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:test_post) { create(:post, :with_images,  user: user) }
  let!(:comments) { create_list(:comment, 3, post: test_post, user: user) }

  before do
    sign_in user
  end

  context 'indexアクションにリクエストを送った場合' do
    describe 'GET /api/comments' do
      it '200ステータスが返ってくる' do
        get api_comments_path(post_id: test_post.id)
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body.length).to eq 3
        expect(body[0]['content']).to eq comments.first.content
        expect(body[1]['content']).to eq comments.second.content
        expect(body[2]['content']).to eq comments.third.content
      end
    end
  end

  context 'createアクションにリクエストを送った場合' do
    describe 'POST /api/comments' do
      it '200ステータスが返ってくる' do
        comment_params = {
          content:Faker::Lorem.characters(number: 10),
        }

        post api_comments_path(post_id: test_post.id), params: { comment: comment_params }
        expect(response).to have_http_status(200)

        body = JSON.parse(response.body)
        expect(body['content']).to eq comment_params[:content]
      end
    end
  end
end
