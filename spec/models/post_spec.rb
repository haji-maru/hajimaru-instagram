require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'タイトルと画像が入力されている場合' do
    before do
      user = User.create!({
        email: 'test@example.com',
        password: 'password',
        username: 'test'
      })
      @post = user.posts.build({
        content: Faker::Lorem.characters(number: 10)
      })
    end

    it '投稿が保存できる' do
      expect(@post).to be_valid
    end
  end
end
