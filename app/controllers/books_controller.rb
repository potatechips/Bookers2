class BooksController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user?,only: [:edit, :update ,:destroy]


    def create
    	@book_new = Book.new(book_params)
    	@book_new.user_id = current_user.id
    	if  @book_new.save
    	    flash[:notice] = "successfully created book!"
    	    redirect_to book_path(@book_new)
      else
          @user = current_user
          @books = Book.all
        	render :index
      end
    end

    def index
    	 @user = current_user
  	     @book_new = Book.new
  	     @books = Book.all

    end

    def show
        @book = Book.find(params[:id])
        @book_new = Book.new
        @user = @book.user

        @book_comments = BookComment.all
        @book_comment = BookComment.new
    end

    def edit
        @book =Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
           flash[:notice] = "successfully edited!"
           redirect_to book_path(@book.id)
        else
           render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
           book.destroy
           flash[:notice]="successfully deleted!"
           redirect_to books_path
    end

    protected
    def correct_user?
           @book = Book.find(params[:id])
        if @book.user.id != current_user.id
           flash[:notice] = "can't successfully access!"
           redirect_to books_path
        end
    end

    private
    def book_params
    	params.require(:book).permit(:title,:body)
    end

end
