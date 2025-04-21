require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと画像が入力されている場合' do
    let!(:post) do
      user.posts.build({
        content: Faker::Lorem.characters(number: 10)
      })
    end

    it '投稿が保存できる' do
      expect(post).to be_valid
    end
  end

  context 'タイトルの文字が一文字の場合' do
    let!(:post) do
      user.posts.create({
        content: Faker::Lorem.characters(number: 1)
      })
    end

    it '投稿を保存できない' do
      expect(post.errors.messages[:content][0]).to eq('は2文字以上で入力してください')
    end
  end
end
