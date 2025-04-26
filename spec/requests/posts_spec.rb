require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, :with_images, user: user) }

  before do
    sign_in user
  end

  describe 'GET /posts' do
    it '200ステータスが返ってくる' do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /posts' do
    let!(:image_path) { Rails.root.join('app/assets/images/back-icon.png') }
    let!(:image_file) { fixture_file_upload(image_path, 'image/png') }

    context '投稿内容と画像の選択が行われている場合' do
      it '投稿と画像が保存される' do
        post_params = {
          content:Faker::Lorem.characters(number: 20),
          images: [image_file]
        }

        post posts_path, params: { post: post_params }

        expect(response).to have_http_status(302)
        expect(Post.last.content).to eq(post_params[:content])
        expect(Post.last.images.attached?).to be true
        expect(Post.last.images.first.filename.to_s).to eq('back-icon.png')
      end
    end
  end
end
