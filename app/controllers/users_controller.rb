class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:update]

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @following_users = @user.following_users
    @follower_users = @user.follower_users
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
    
    
  end

  def follows

  @user = User.find(params[:id])
  @users = @user.following_users
  end

  def followers

  @user = User.find(params[:id])

  @users = @user.follower_users
  end



  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
   @user = User.find(params[:id])
 if @user.update(user_params)
   flash[:notice] = "successfully"
  redirect_to user_path(@user.id)
 else
    flash.now[:notice] = "error"
  render :edit
 end
  end


   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(user)
    end
  end
end
