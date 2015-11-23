class CommentsController < ApplicationController
  # GET /comments/new
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params) 
  end
  
  private 
  def comment_params
    params.require(:comment).permit(:title, :content, :user_id)

  end
end
