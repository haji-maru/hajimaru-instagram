require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'タイトルと画像が入力されている場合' do
    let!(:user) do
      User.create!({
        email: 'test@example.com',
        password: 'password',
        username: 'test'
      })
    end

    let!(:post) do
      user.posts.build({
        content: Faker::Lorem.characters(number: 10)
      })
    end

    it '投稿が保存できる' do
      expect(post).to be_valid
    end
  end
end
