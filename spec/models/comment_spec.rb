require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { build(:post, user: user) }


  context 'コメントが入力されている場合' do
    let!(:comment) { build(:comment, user: user, post: post) }

    it 'コメントが保存できる' do
      expect(comment).to be_valid
    end
  end
end
