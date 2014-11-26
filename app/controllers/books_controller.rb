class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :reserve]

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "#{@book.title} was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end 
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "#{book.title} updated succesfully."}
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @food.destroy
    format.html { redirect_to books_url, notice: "Book was deleted successfully."}
    format.json { head :no_content }
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :copies, :author, :link, :description, :year, :cover_image, :remaining_copies)
  end

end