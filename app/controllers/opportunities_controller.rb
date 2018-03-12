class OpportunitiesController < ApplicationController
	before_action :set_opportunity, only: [:show, :edit, :update]

	def index

	end

	def show

	end

	def new
		@opportunity = Opportunity.new
	end

	def create

	end

	def edit

	end

	def update

	end

	private
		def set_opportunity
			@opportunity = Opportunity.find(params[:id])
		end
end