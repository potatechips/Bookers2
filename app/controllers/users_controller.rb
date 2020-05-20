class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
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
		if user.update
		   flash[:notice] = "successfully update user!"
		   redirect_to user_path(@user.id)
		else
		   render :edit
		end
	end

	private
    def user_params
        params.require(:user).permit(:name, :profile_image_id,:introduction)
    end

end
