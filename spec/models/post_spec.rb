# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと画像が入力されている場合' do
    let!(:post) { build(:post, user: user) }

    it '投稿が保存できる' do
      expect(post).to be_valid
    end
  end

  context 'タイトルの文字が一文字の場合' do
    let!(:post) { build(:post, content: Faker::Lorem.characters(number: 1), user: user) }

    before do
      post.save
    end

    it '投稿を保存できない' do
      expect(post.errors.messages[:content][0]).to eq('は2文字以上で入力してください')
    end
  end
end
