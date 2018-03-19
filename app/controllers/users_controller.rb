class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :authenticate_user!

	def index
		if params[:search]
			byebug
			@users = User.search(params[:search])
			if @users.count == 0
				flash[:alert] = "No matches found"
				@users = User.developers
			end
		else
			@users = User.developers
		end
	end

	def show
		@social_links = @user.social_links

	end

	def edit
		if current_user == @user
			if @user.social_links.count == 0
				@user.social_links.build
			end

			if @user.user_skills.count == 0
				@user.user_skills.build
			end

			if @user.bio == 'add bio'
				@user.bio = ''
			end
		else
			redirect_to users_path, alert: "Access denied"
		end
	end

	def update
		if current_user == @user
			if @user.update(user_params)
				redirect_to user_path @user, notice: "Profile successfully updated"
			else
				render action: 'edit'
			end
		else
			redirect_to users_path, alert: "Access denied"
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
					:main_image,
					:thumb_image,
					social_links_attributes: [
							:name,
							:url
					],
					user_skills_attributes: [
							:title,
							:description
					]
			)
		end
end