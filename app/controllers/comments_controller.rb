require 'email'

class CommentsController < ApplicationController

  include Email

  def new
    @comment = Comment.new

  end

  def create
    cp = comment_params
    cp.merge(ticket_id: params[:ticket_id])
    @comment = Comment.new(cp)

    ticket = Ticket.find(params[:ticket_id])

    send_email if ticket["user_id"] != session[:user_id]

    if @comment.save
      redirect_to '/tickets/' + params[:ticket_id]
    else
      render'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
          .merge(user_id: session[:user_id])
  end

end
