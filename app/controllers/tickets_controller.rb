require 'email'

class TicketsController < ApplicationController

  include Email

  before_action :require_user

  def index
    @tickets = Ticket.select { |x| x.status == 'open' }
  end

  def show
    @ticket = Ticket.find(params[:id])
    session[:ticket] = @ticket
    @comments = @ticket.comments.order(created_at: :desc)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Message.new

    if @ticket.save
      send_email
      redirect_to '/tickets'
    else
      render 'new'
    end
  end

  def update
    Ticket.find(params[:id]).update_attribute(:status, 'closed')
    redirect_to '/tickets'
  end

end
