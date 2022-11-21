class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @book = Book.new
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
    @users = User.all
    @user1 = current_user
    @books = @user.books
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end
end
