require 'email'

class TicketsController < ApplicationController

  include Email

  before_action :require_user

  def index
    @tickets = Ticket.where(status: "open")
    tickets_grouped_by_managers = Ticket.group(:user_id).order('count_all asc').count
                                    # .group_by{|k, v| v}.min_by(&:first).last

    puts tickets_grouped_by_managers
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
    tickets_grouped_by_managers = Ticket.group(:user_id).count
    puts tickets_grouped_by_managers
    target_user = User.group(:user_id).count
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
