class PostsController < ApplicationController
  respond_to :json

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created Post."
    end
    respond_with @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy # how do I handle destroys while using this pattern?
    flash[:notice] = "Successfully destroyed Post."
    respond_with @post
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
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully created Post."
    end
    respond_with @post
  end

end
