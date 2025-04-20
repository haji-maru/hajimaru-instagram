require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'タイトルと画像が入力されていれば、投稿が保存できる' do
    user = User.create!({
      email: 'test@example.com',
      password: 'password',
      username: 'test'
    })
    post = user.posts.build({
      content: Faker::Lorem.characters(number: 10)
    })

    expect(post).to be_valid
  end
end
