class BooksController < ApplicationController




  def create
    @book =Book.new(book_params)
    if @book.save
      flash[:notice]= "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books= Book.all
      render ("books/index")
    end
  end

  def index
    @books =Book.all
     @book =Book.new
  end

  def show
    @book =Book.find(params[:id])
  end

  def edit
    @book =Book.find(params[:id])
  end

  def update
    @book =Book.find(params[:id])
    @book.update(book_params)
    if @book.save
    flash[:notice]= "Book was successfully updated."
    redirect_to book_path(@book.id)
   else
      @books=Book.all
      render action: :edit
   end
  end

  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
