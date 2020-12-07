class BooksController < ApplicationController
  def index
    @books = []
    if params[:search_title] != nil
      puts "First Search #{params[:search_title]}!"
      @books = Book.search_title(params[:search_title]);
    elsif params[:search_author] != nil
      puts "Second Search #{:search_author}"
      @books = Book.search_author(params[:search_author]);
    elsif params[:search_isbn] != nil
      puts "Third Search #{:search_isbn}"
      @books = Book.search_isbn(params[:search_isbn]);
    end
  end

  def search_admin
    @books = []
    if params[:search_title] != nil
      puts "First Search #{params[:search_title]}!"
      @books = Book.search_title(params[:search_title]);
    elsif params[:search_author] != nil
      puts "Second Search #{:search_author}"
      @books = Book.search_author(params[:search_author]);
    elsif params[:search_isbn] != nil
      puts "Third Search #{:search_isbn}"
      @books = Book.search_isbn(params[:search_isbn]);
    end
  end

  def checkout
    @book = Book.find(params[:id])
    if @book.copies < 1
      redirect_to '/books/search_admin?nocopies=true&errorid=' + params[:id]
    else
      @book.update(copies: @book.copies - 1);
      redirect_to '/books/search_admin'
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to '/books/search_admin?notfound=true&errorid=' + params[:id]
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:title, :author, :isbn, :copies))
      redirect_to '/books/search_admin'
    else
      redirect_to '/edit/' + params[:id] + '?notvalid=true'
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to '/edit/' + params[:id] + '?notfound=true'
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :author, :isbn, :copies))
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end
end
