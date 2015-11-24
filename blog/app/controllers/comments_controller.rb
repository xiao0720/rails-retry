class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = 'Comment is succesfully posted.'
      redirect_to @post
      # render plain: params[:comment].inspect
    else
      @comment.errors[:content].each do |content|
        flash[:danger] = "Content " + content 
      end
      redirect_to new_post_comment_path(@post) 
    end
  end

  def index
    @comments = Comment.all
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
