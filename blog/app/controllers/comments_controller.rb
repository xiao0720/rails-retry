class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        flash[:success] = 'Comment is succesfully posted.'
        format.html { redirect_to @post }
        # render plain: params[:comment].inspect
      else
        format.html { render :new }
      end
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
