require 'rails_helper'

RSpec.describe 'Timeline', type: :system do
  let!(:user) { create(:user, :with_profile) }
  let!(:follower1) { create(:user) }
  let!(:posts) { create_list(:post, 3, :with_images, user: follower1) }

  context 'ログインしている場合' do
    before do
      sign_in user
      user.follow!(follower1)
    end

    it '24時間以内の投稿がタイムラインに表示される' do
      visit timeline_path
      posts.each do |post|
        expect(page).to have_css('.post-comments', text: post.content)
      end
    end
  end
end