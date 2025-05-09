require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, :with_images, user: user) }

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
end