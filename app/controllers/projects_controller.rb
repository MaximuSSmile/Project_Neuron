class ProjectsController < ApplicationController

	before_action :find_soul
	before_action :find_project, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

	def soul_all_projects

	end

	def index
		@projects = Project.where(soul_id: @soul).order("created_at DESC") #.reject { |p| p.id == @project.id}
	end

	def new
		@project = @soul.projects.new
	end

	def create
		@project = @soul.projects.new project_params	
		if @project.save
			redirect_to soul_project_path(@soul, @project)
		else
			render 'new'
		end	
	end

	def show
		@projects = Project.where(soul_id: @soul).order("created_at DESC")  
		@projcomments = Projcomment.where(project_id: @project)
	end

	def edit
		
	end

	def update
		if @project.update project_params
			redirect_to soul_project_path(@soul, @project), notice: "Project was succesfully updated!" 
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to soul_projects_path
	end

		def upvote
			@project.upvote_by current_user
			redirect_to :back
		end

		def downvote
			@project.downvote_from current_user
			redirect_to :back
		end

	private

	def project_params
		params.require(:project).permit(:name, :description, :url, :team, :client, :imgproject, 
				projectteams_attributes: [:id, :team, :_destroy])
	end

	def find_soul
		@soul = Soul.find(params[:soul_id])
	end

	def find_project
		@project = Project.find(params[:id])
		#@soul = Soul.find(params[:soul_id])
		#@project = @soul.projects.find(params[:id])
		#@project = Project.find_by(soul_id: params[:project_id])
		#@project = @soul.projects.where(id: params[:id])
		#@message.comments.where(id: params[:id])
	end
end
