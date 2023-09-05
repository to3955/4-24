class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @user = @book.user
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
    #redirect_to request.referer
  end


  def destroy
    @book_comment = BookComment.find(params[:id]).destroy
    @book_comment.destroy
    @book = Book.find(params[:book_id])
   # redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
