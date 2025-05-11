# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
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

  context 'コメントの文字入力がない場合' do
    let!(:comment) { build(:comment, content: '', user: user, post: post) }

    before do
      comment.save
    end

    it 'コメントを保存できない' do
      expect(comment.errors.messages[:content][0]).to eq('を入力してください')
    end
  end
end
