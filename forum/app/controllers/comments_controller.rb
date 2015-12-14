class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])

    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end

    respond_to do |format|
      if @comment.save
        flash[:success] = 'Comment is succesfully posted.'
        format.html { redirect_to @post }
        #render plain: params[:comment].inspect
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
