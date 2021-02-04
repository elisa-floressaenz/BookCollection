class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    flash.alert = "#{@book.title} was shown."

  end

  def new 
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path, notice: "#{@book.title} was added."
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to root_path, notice: "#{@book.title} was updated."
    else
      render :edit
    end
  end

  def delete
    @book = Book.find(params[:id])
    ##redirect_to "delete", :id => params[:id]
  end  

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path , notice: "#{@book.title} was deleted."
  end


  private
    def book_params
      params.require(:book).permit(:title, :author, :genre, :price, :publishedDate)
    end

end
