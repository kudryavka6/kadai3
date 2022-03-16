class UsersController < ApplicationController

  def index
    @user= current_user
    @book_new= Book.new
    @users= User.all
  end

  def show
    @book_new= Book.new
    @user= User.find(params[:id])
    @books = Book.where(user_id: @user.id)

  end

  def edit
    @user= User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user), notice: 'You have You have created book successfully.'
    else
     render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
