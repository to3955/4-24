class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to show_book_path(@book.id)
  end


   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
