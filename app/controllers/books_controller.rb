class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
  	@books = Book.all.order("created_at DESC")
  end

  def new
  	@book = Book.new 
  end

  def create
  	@book =Book.new(post_params)
  	if @book.save
  		redirect_to @book
  	else
  		render 'new'
  end
end

def show
	@book = Book.find(params[:id])
end

def edit
        #@book = Book.find(params[:id])
  end

def update 
        #@book = Book.find(params[:id])
    if @book.update(post_params)
      redirect_to @book
    else
      render edit
    end
  end

  def destroy
      @book.destroy
      redirect_to root_path
  end


  private
  @authors_attibutes =Author.new

  def find_book
    @book = Book.find(params[:id])
  end

  def post_params
  	params.require(:book).permit(:title, :description, :author_id)
  end

end
