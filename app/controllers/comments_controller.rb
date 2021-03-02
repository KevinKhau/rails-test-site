require 'email'

class CommentsController < ApplicationController

  include Email

  def new
    @comment = Comment.new
  end

  def create
    ticket_id = params["comment"]["ticket_id"]
    @comment = Comment.new(comment_params)

    ticket = Ticket.find(ticket_id)

    send_email if ticket["user_id"] != session[:user_id]

    if @comment.save
      redirect_to '/tickets/' + ticket_id
    else
      render'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :ticket_id)
          .merge(user_id: session[:user_id])
  end

end
