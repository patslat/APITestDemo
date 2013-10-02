class CommentsController < ApplicationController
  respond_to :json

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created Comment."
    end
    respond_with @comment
  end

  def destroy
    @comment = Post.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed Comment."
    respond_with @comment
  end

  def index
    @post = Post.find(params[:post_id]).include(:comments)
    @comments = @post.comments
    respond_with @comments
  end

  def show
    @comment = Comment.find(params[:id])
    respond_with @comment
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated Comment."
    end
    respond_with @comment
  end
end
