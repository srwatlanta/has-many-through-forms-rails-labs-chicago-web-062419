class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @users = User.all
  end

  def index
    @posts = Post.all
  end

  def new
    @categories = Category.all
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [], categories_attributes: [:name], comment_attributes: [:content])
  end
end
