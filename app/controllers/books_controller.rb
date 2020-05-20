class BooksController < ApplicationController
	before_action :authenticate_user!

	def new
		@books = Book.new
    end

    def create
    	book = Book.new(book_params)
    	@book.user_id = current_user.id
    	if  book.save
    	    flash[:notice] = "successfully created book!"
    	    redirect_to book_path(id: @book.id)
        else
        	render :index
        end
    end

    def index
    	 @user = current_user
  	     @book = Book.new
  	     @books = Book.all
    end

    def show
    end

    def book_params
    	params.require(:book).permit(:title,:body,)
    end

end
