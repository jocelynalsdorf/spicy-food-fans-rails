class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  # def show
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.find(params[:id])
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment saved"
      redirect_to post_path(@comment.post_id)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post, @comment)
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :rating, :user, :post_id)
  end
end
