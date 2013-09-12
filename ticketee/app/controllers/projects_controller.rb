class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def show
	end

	def new
    @project = Project.new
	end

	def create
		@project = Project.new(project_params)
		 
		if @project.save
			redirect_to @project, notice: "Project has been created."
		else
			flash[:alert] = "Project has not been created."
			render :action => 'new'
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
		  redirect_to @project, notice: 'Project has been updated.'
		else
			flash[:alert] = 'Project has not been updated.'
			render action: 'edit'
		end	
	end

	def destroy
		@project.destroy
		redirect_to projects_path, notice: 'Project has been destroyed.'
	end

	private

	def project_params
		params.require(:project).permit(:name, :description)
	end

	def set_project
		@project = Project.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = 'The project you were looking for could not be found.'
		redirect_to projects_path
	end
end
