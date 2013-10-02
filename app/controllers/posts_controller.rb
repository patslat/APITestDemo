class PostsController < ApplicationController
  respond_to :json

  def create
    @post = Post.new(params[:post])
    @post.save
    respond_with @post
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy # how do I handle destroys while using this pattern?
      respond_with true
    else
      respond_with @post
    end
  end

  def index
    @posts = Post.all
    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    respond_with @post
  end

end
