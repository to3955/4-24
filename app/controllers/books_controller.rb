class BooksController < ApplicationController

  def new
    @book = Book.new(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
    flash.now[:notice] = "error"
    render :new
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id]) 
    @books = Book.all
  end

 def edit
   @book = Book.find(params[:id])
 end

 def update
   book = Book.find(params[:id])
   if book.update(book_params)
   flash[:notice] = "successfully" 
   redirect_to book_path(book)
   else
   flash.now[:notice] = "error"
   render :new
   end
 end
 
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path
  end


   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
