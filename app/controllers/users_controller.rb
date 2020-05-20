class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
	end

	def edit
	end

	def update
		@user = User.find(params[:id])
		user.update
		redirect_to user_path(@user.id)
	end

	private
    def user_params
        params.require(:user).permit(:name, :profile_image_id,:introduction)
    end

end
