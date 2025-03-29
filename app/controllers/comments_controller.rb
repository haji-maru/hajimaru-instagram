class CommentsController < ApplicationController

  def index
    post = Post.find(params[:post_id])
    comments = post.comments
  end

  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(post), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end