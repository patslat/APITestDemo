class Api::V1::PostsController < ApplicationController
  respond_to :json

  def create
    @post = Post.new(params[:post])
    if @post.save
      render :json => @post,
             :status => :ok
    else
      render :json => @post.errors,
             :status => :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    head (@post.destroy ? :no_content : :unprocessable_entity)
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
