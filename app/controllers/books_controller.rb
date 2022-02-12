class BooksController < ApplicationController
  # def new
  #   @book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book_detail = Book.find(params[:id])#@bookが被るため@book_detailと宣言
    @user = User.find(@book_detail.user_id)

    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    # 他人の投稿編集画面に遷移できないように設定(遷移先はブック一覧のビュー)
    if @book.user == current_user
      render "edit"
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
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end