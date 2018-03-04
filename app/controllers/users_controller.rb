class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :authenticate_user!

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			# todo check role set
			redirect_to user_path @user, notice: "Updated record successfully"
		else
			render action: 'edit'
		end
	end


	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:name, :email)
		end
end