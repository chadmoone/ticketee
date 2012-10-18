class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, :only => [:show, :edit, :destroy, :update]
  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket])
    @ticket.user = current_user

    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end

  private
    def find_ticket
      @ticket = @project.tickets.find(params[:id])
    end
    def find_project
      @project = Project.find(params[:project_id])
    end
end