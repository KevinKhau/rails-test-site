require 'email'

class TicketsController < ApplicationController

  include Email

  before_action :require_user

  def index
    @tickets = Ticket.where(status: "open")
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comments = @ticket.comments.order(created_at: :desc)
    @comment_add = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    managers_with_min_open_tickets = Ticket.all.group_by{|t| t.user_id}
                                           .map{|k,v| [k,v.filter{|x| x.status == 'open'}.length]}.to_h
                                           .group_by{|_,v| v}.min[1].map{|v| v[0]}
    manager = managers_with_min_open_tickets.sample
    @ticket = Message.new
    if @ticket.save
      send_email
      redirect_to '/tickets'
    end
  end

  def update
    Ticket.find(params[:id]).update_attribute(:status, 'closed')
    redirect_to '/tickets'
  end


end
