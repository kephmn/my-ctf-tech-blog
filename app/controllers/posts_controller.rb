class PostsController < ApplicationController
  def index
    @posts = Post.published

    @posts = @posts.joins(:tags).where(tags: { name: params[:tag] }) if params[:tag]
  end

  def show
    @post = Post.published.find_by!(slug: params[:slug])
  end

  def category
    @posts = Post.published.where(category: params[:category])

    render :index
  end
end
