class TicketsController < ApplicationController

  before_action :require_user, only: [:index, :show]

  def index
    @tickets = Ticket.select { |x| x.status == 'open' }
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comments = @ticket.comments
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Message.new(message_params)
    if @ticket.save
      redirect_to '/messages'
      send_email
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

  end

end
