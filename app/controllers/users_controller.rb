class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user?,only: [:edit, :update]

	def index
		@user = current_user
		@users = User.all
		@book_new = Book.new
	end

	def show
		@book_new = Book.new
		@user = User.find(params[:id])
		@books = @user.books
	end

	def edit
		@user = User.find(params[:id])
		 if @user.id != current_user.id
            flash[:notice] = "can't successfully access!"
            redirect_to user_path(current_user.id)
         end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   flash[:notice] = "successfully update user!"
		   redirect_to user_path(@user.id)
		else
		   render :edit
		end
	end

# ==============user,usersで呼ぶデータを定義する、userは同じ================
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
# ==============↑usersで一覧表示したいデータの区別を行う================


    protected
    def correct_user?
    	user = User.find(params[:id])
    	if user.id != current_user.id
    	   flash[:notice] = "can't successfully access!"
           redirect_to user_path(current_user.id)
        end
    end

	private
    def user_params
        params.require(:user).permit(:name, :profile_image,:introduction)
    end

end
