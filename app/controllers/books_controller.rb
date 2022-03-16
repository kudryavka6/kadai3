class BooksController < ApplicationController

  def index
    @user= current_user
    @book_new= Book.new
    @books= Book.all
  end

  def create
    @book_new= Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new)
    else
      @user= current_user
      @books= Book.all
      render :index
    end
  end

  def show
    @book_new= Book.new
    @book= Book.find(params[:id])
    @user= @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
       redirect_to book_path(@book), notice: 'You have updated book successfully.'
      else
       render :edit
      end
  end

  private

  def book_params
     params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
  end


end
