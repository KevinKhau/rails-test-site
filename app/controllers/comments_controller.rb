require 'email'

class CommentsController < ApplicationController

  include Email

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    ticket = session[:ticket]

    send_email if ticket["user_id"] != session[:user_id]

    if @comment.save
      redirect_to '/tickets/' + ticket["id"].to_s
    else
      render'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
          .merge(user_id: session[:user_id])
          .merge(ticket_id: session[:ticket]["id"])
  end

end
