class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to '/tickets/' + session[:ticket_id].to_s
    else
      render'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
          .merge(user_id: session[:user_id])
          .merge(ticket_id: session[:ticket_id])
  end

end
