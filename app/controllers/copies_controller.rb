class CopiesController < ApplicationController
  before_action :set_copy, only: [:show, :edit, :update, :destroy]

  def index
    @copies = Copy.all
  end

  def show
  end

  def new
    @copy = Copy.new
  end

  def create
    @copy = Copy.new(copy_params)
    respond_to do |format|
      if @copy.save
        format.html { redirect_to @copy }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @copy.update(copy_params)
        format.html { redirect_to @copy, notice: "Copy was update successfully." }
      else
        format.html { render :update }
      end
    end
  end

  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to copies_url, notice: "Copy was deleted succesfully."}
      format.json { head :no_content }
    end
  end

  private

  def set_copy
    @copy = Copy.find(params[:id])
  end

  def copy_params
    params.require(:copy).permit(:copy_number, :book_id)
  end
end