class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = @user.book.page(params{:page})
  end

  def edit
    @user = User.find(params{:id})
  end
end
