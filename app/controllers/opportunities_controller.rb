class OpportunitiesController < ApplicationController
	before_action :set_opportunity, only: [:show, :edit, :update]

	def index
		@opportunities = Opportunity.order("created_at DESC")
	end

	def show
		@skills = @opportunity.opportunity_skills
		@author = @opportunity.author
    respond_to do |format|
      format.html
      format.json { render json: @opportunity }
    end
	end

	def new
		@opportunity = Opportunity.new
		@opportunity.opportunity_skills.build
	end

	def create
		@opportunity = Opportunity.new(opportunity_params)
		if @opportunity.save
			redirect_to opportunities_path, notice: "New project added"
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
				redirect_to opportunity_path(@opportunity), notice: "Project successfully updated"
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
			params.require(:opportunity).permit(
					:title,
					:description,
					:author_id,
					opportunity_skills_attributes: [
							:title,
							:description
					]
			)
		end
end
