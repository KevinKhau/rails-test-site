class TicketsController < ApplicationController

  before_action :require_user

  def index
    @tickets = Ticket.select { |x| x.status == 'open' }
  end

  def show
    @ticket = Ticket.find(params[:id])
    session[:ticket_id] = @ticket.id
    @comments = @ticket.comments
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

  private def send_email
    # TODO
    ActionMailer::Base.mail(
      from: "candidature-kevin-khau@simplebo.com",
      to: "kkhau@hotmail.fr",
      subject: "test",
      body: "New comment added" << :content.to_s
    ).deliver
  end

  def update
    Ticket.find(params[:id]).update_attribute(:status, 'closed')
    redirect_to '/tickets'
  end

end
