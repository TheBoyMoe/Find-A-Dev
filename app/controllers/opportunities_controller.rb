class OpportunitiesController < ApplicationController
	before_action :set_opportunity, only: [:show, :edit, :update]

	def index
		@opportunities = Opportunity.all
	end

	def show
	end

	def new
		@opportunity = Opportunity.new
		@opportunity.opportunity_skills.build
	end

	def create
		byebug
		@opportunity = Opportunity.new(opportunity_params)
		if @opportunity.save
			redirect_to opportunities_path, notice: "New opportunity added"
		else
			render :new
		end
	end

	def edit
		if current_user != @opportunity.author
			redirect_to welcome_path, alert: "Access denied"
		end
	end

	def update
		if current_user == @opportunity.author
			if @opportunity.update(opportunity_params)
				redirect_to opportunity_path(@opportunity), notice: "Opportunity successfully updated"
			else
				render :edit
			end
		else
			redirect_to welcome_path, alert: "Access denied"
		end
	end

	private
		def set_opportunity
			@opportunity = Opportunity.find(params[:id])
		end

		def opportunity_params
			params.require(:opportunity).permit(:description, :author_id)
		end
end