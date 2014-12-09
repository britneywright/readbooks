class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update, :edit, :destroy]
  before_action :require_admin, except: [:new, :create, :show]
  
  def index
    @statuses = Status.all
  end

  def show
  end

  def edit
  end

  def new
    @book = Book.find_by_slug(params[:book_id])
    @status = @book.statuses.new
  end

  def create
    @book = Book.find_by_slug(params[:book_id])
    @status = @book.statuses.new(status_params)
    respond_to do |format|
      if @status.save
        ReservationMailer.confirmation_email(@status).deliver
        ReservationMailer.request_email(@status).deliver
        format.html { redirect_to @status.book, notice: "Reservation submitted successfully." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @status.destroy
    redirect_to statuses_url, notice: "Status was deleted successfully."
  end

  private

  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:borrower_name, :borrower_email, :borrower_phone, :checked_out, :checked_in, :copy_id, :book_id)
  end
end