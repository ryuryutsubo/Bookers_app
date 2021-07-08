class BooksController < ApplicationController
  def index

   @books = Book.all
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index

    end
  end

  def show
    @books = Book.find(params[:id])
  end


  def edit
    @books = Book.find(params[:id])
  end

def update
  @books = Book.find(params[:id])
  if @books.update(book_params)
    flash[:notice] = "Book was successfully updated."
  redirect_to book_path(@books.id)
  else

  render :edit
  end
end

def destroy
  book = Book.find(params[:id])
  if book.destroy
    flash[:notice] = "Book was successfully destroyed."
  redirect_to books_path
  else
 render :new
  end
end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end