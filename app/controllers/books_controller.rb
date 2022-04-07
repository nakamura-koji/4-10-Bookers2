class BooksController < ApplicationController

  def index
    @books=Book.all
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book.id)
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])

  end

  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path #最終的には本の一覧画面に移動
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path #最終的には本の一覧画面に移動
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end