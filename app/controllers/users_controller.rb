class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :authenticate_user!

	def index
		if params[:search]
			@users = User.search(params[:search])
			provide_feedback
		else
			@users = User.developers
		end
	end

	def show
		@social_links = @user.social_links
	end

	def edit
		if current_user == @user
			config_user
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

		def config_user
			if @user.social_links.count == 0
				@user.social_links.build
			end

			if @user.user_skills.count == 0
				@user.user_skills.build
			end

			if @user.bio == 'add bio'
				@user.bio = ''
			end
		end

		def provide_feedback
			@query = nil
			if @users.count == 0
				flash.now[:alert] = "No matches found"
				@users = User.developers
			else
				@query = params[:search] unless params[:search].empty?
			end
      respond_to do |format|
        byebug
        format.html
        format.json { render json: @users }
      end
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
