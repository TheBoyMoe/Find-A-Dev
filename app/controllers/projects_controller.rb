class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update]

	def index
		@projects = Project.order("created_at DESC")
	end

	def show
		@skills = @project.project_skills
		@author = @project.author
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
	end

	def new
		@project = Project.new
		@project.project_skills.build
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path, notice: "New project added"
		else
			render :new
		end
	end

	def edit
		if current_user != @project.author
			redirect_to welcome_path, alert: "Access denied"
		end
	end

	def update
		if current_user == @project.author
			if @project.update(project_params)
				redirect_to project_path(@project), notice: "Project successfully updated"
			else
				render :edit
			end
		else
			redirect_to welcome_path, alert: "Access denied"
		end
	end

	private
		def set_project
			@project = Project.find(params[:id])
		end

		def project_params
			params.require(:project).permit(
					:title,
					:description,
					:author_id,
					project_skills_attributes: [
							:title,
							:description
					]
			)
		end
end
