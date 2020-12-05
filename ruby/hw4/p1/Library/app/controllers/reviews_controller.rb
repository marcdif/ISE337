class ReviewsController < ApplicationController
  def index
  end

  def addreview
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(params.require(:review).permit(:reviewer, :body))
    redirect_to '/reviews/' + @book.id.to_s
  end

  def show
    # @review = Review.find(params[:id])
    @book = Book.find(params[:id])

  end
end
