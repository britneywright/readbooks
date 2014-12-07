class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :admin]
  http_basic_authenticate_with :name => ENV['KEY1'], :password => ENV['KEY2'], except: [:index, :show]

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def admin
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
        format.html { redirect_to @book, notice: "#{@book.title} updated succesfully."}
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was deleted successfully."}
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find_by_slug(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :link, :description, :year, :cover_image, :initial_copies, :slug)
  end

end