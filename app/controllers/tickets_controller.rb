class TicketsController < ApplicationController

  before_action :require_user, only: [:index, :show]

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
    @ticket = Message.new(message_params)

    if @ticket.save
      send_email
      redirect_to '/messages'
    else
      render 'new'
    end
  end

  private
  def message_params
    params.require(:ticket).permit(:content)
  end

  private
  def send_email
    # TODO
    ActionMailer::Base.mail(
      from: "candidature-kevin-khau@simplebo.com",
      to: "kkhau@hotmail.fr",
      subject: "test",
      body: "New comment added" << :content.to_s
    ).deliver
  end

end
