class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Books.all
  end

  def show
  end

  def edit
  end

  def new
    @book = Book.new
  end

  def create
  end

  def udpate
  end

  def destroy
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :copies, :year, :cover_image)
  end

end