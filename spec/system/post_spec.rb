require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, :with_images, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    it '投稿一覧が表示される' do
      visit root_path
      posts.each do |post|
        expect(page).to have_css('.post-comments', text: post.content)
      end
    end

    it '吹き出しアイコンを押したらコメント一覧が表示される' do
      visit root_path
      all('.comment-button').first.click
      expect(page).to have_css('.post-comment-title', text: 'Comment')
    end

    it 'アバターアイコンを押したらプロフィールが表示される' do
      visit root_path
      all('.post-avatar').first.click
      expect(page).to have_css('.profile-username', text: user.username)
    end

    it 'Timelineを押したらタイムラインが表示される' do
      visit root_path
      click_link('Timeline')
      expect(page).to have_current_path(timeline_path)
    end

    it 'カメラアイコンを押したら投稿ページが表示される' do
      visit root_path
      find('.post-create-icon').click
      expect(page).to have_current_path(new_post_path)
      expect(page).to have_css('.post-username', text: user.username)
    end
  end
end