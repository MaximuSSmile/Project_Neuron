class HobbiesController < ApplicationController
	before_action :find_soul
	before_action :find_hobby, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

	def soul_all_hobbies

	end

	def index
		@hobbies = Hobby.where(soul_id: @soul).order("created_at DESC") #.reject { |p| p.id == @hobby.id}
	end

	def new
		@hobby = @soul.hobbies.new
	end

	def create
		@hobby = @soul.hobbies.new hobby_params	
		if @hobby.save
			redirect_to soul_hobby_path(@soul, @hobby)
		else
			render 'new'
		end	
	end

	def show
		@hobbies = Hobby.where(soul_id: @soul).order("created_at DESC")  
		@hobcomments = Hobcomment.where(hobby_id: @hobby)
	end

	def edit
		
	end

	def update
		if @hobby.update hobby_params
			redirect_to soul_hobby_path(@soul, @hobby), notice: "hobby was succesfully updated!" 
		else
			render 'edit'
		end
	end

	def destroy
		@hobby.destroy
		redirect_to soul_hobbies_path(@soul)
	end


		def upvote
			@hobby.upvote_by @soul
			redirect_to :back
		end

		def downvote
			@hobby.downvote_from @soul
			redirect_to :back
		end


	private

	def hobby_params
		params.require(:hobby).permit(:title, :description, :url, :imghobby, 
				hobbylists_attributes: [:id, :hob_mark, :_destroy])
	end

	def find_soul
		@soul = Soul.find(params[:soul_id])
	end

	def find_hobby
		@hobby = Hobby.find(params[:id])
		#@soul = Soul.find(params[:soul_id])
		#@hobby = @soul.hobbies.find(params[:id])
		#@hobby = hobby.find_by(soul_id: params[:hobby_id])
		#@hobby = @soul.hobbies.where(id: params[:id])
		#@message.comments.where(id: params[:id])
	end
end
