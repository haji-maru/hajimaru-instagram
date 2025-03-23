class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:index, :new]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: '保存できました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, images: [])
  end

  def set_post
    @profile = current_user.prepare_profile
    @user = current_user
  end
end