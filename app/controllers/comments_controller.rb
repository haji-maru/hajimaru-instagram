class CommentsController < ApplicationController

  def index
    post = Post.find(params[:post_id])
    comments = post.comments

    render json: comments, include: ['user.profile']
  end

  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!

    render json: @comment, include: ['user.profile']
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def check_mentions
    mentioned_usernames = @comment.content.scan(/@(\w+)/).flatten
    mentioned_users = User.where(username: mentioned_usernames)
    mentioned_users.each do |mention_user|
      CommentMentionMailer.account_name_mention(mention_user, @comment.user, @comment).deliver_later
    end
  end

end