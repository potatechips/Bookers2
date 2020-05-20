class BooksController < ApplicationController
	before_action :authenticate_user!

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
        @book = Book.find(params[:id])
    end

    def edit
        @book =Book.find(params[:id])
        if @book.user_id != current_user.id
           flash[:notice] = "can't successfully access!"
           redirect_to user_path(@book.user_id)
        end
    end

    def update
        book = Book.find(params[:id])
        if book.update
           flash[:notice] = "successfully edited!"
           redirect_to book_path(@book.id)
        else
           render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        flash[:notice]="successfully delete!"
        redirect_to books_path
    end

    def book_params
    	params.require(:book).permit(:title,:body,)
    end

end
