class StaticPagesController < ApplicationController

  def index
    @books = Book.all
  end

  def about
  end

end