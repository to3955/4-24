class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
    render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @book_new = Book.find(params[:id])
    @user = @book_new.user
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
   render :edit
   end
 end
 
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to book_path
    end
  end

end
