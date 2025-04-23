require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  before do
    sign_in user
  end

  describe 'GET /posts' do
    it '200ステータスが返ってくる' do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end
end
