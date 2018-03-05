class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :authenticate_user!

	def show
		@social_links = @user.social_links
	end

	def edit
		if @user.social_links.count == 0
			@user.social_links.build
		end
		if @user.bio == 'add bio'
			@user.bio = ''
		end
	end

	def update
		if @user.update(user_params)
			redirect_to user_path @user, notice: "Profile successfully updated"
		else
			render action: 'edit'
		end
	end


	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(
					:name,
					:email,
					:role,
					:bio,
					social_links_attributes: [
							:name,
							:url
					],
					skills_attributes: [
							:name,
							:description
					]
			)
		end
end