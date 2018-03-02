class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit]
	before_action :authenticate_user!

	def show
	end

	def edit
	end


	private
		def set_user
			@user = User.find(params[:id])
		end
end