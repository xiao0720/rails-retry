class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to Post.find(comment_params[:post_id])
      # render plain: params[:comment].inspect
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
