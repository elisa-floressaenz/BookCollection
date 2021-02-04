class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new 
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(title: "...", author: "...", genre: "...", price: 0, publishedDate: "...")

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :genre, :price, :publishedDate)
    end

end
