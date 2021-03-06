class QuotationsController < ApplicationController
	before_action :find_soul
	before_action :find_quotation, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

	def soul_all_quotations

	end

	def index
		@quotations = Quotation.where(soul_id: @soul).order("created_at DESC") #.reject { |p| p.id == @quotation.id}
	end

	def new
		@quotation = @soul.quotations.new
	end

	def create
		@quotation = @soul.quotations.new quotation_params	
		if @quotation.save
			redirect_to soul_quotation_path(@soul, @quotation)
		else
			render 'new'
		end	
	end

	def show
		@quotations = Quotation.where(soul_id: @soul).order("created_at DESC")  
		@quotycomments = Quotycomment.where(quotation_id: @quotation)
	end

	def edit
		
	end

	def update
		if @quotation.update quotation_params
			redirect_to soul_quotation_path(@soul, @quotation), notice: "quotation was succesfully updated!" 
		else
			render 'edit'
		end
	end

	def destroy
		@quotation.destroy
		redirect_to soul_quotations_path
	end

		def upvote
			@quotation.upvote_by current_user
			redirect_to :back
		end

		def downvote
			@quotation.downvote_from current_user
			redirect_to :back
		end

	private

	def quotation_params
		params.require(:quotation).permit(:author, :proverb, :description, :datecomment, :created)
	end

	def find_soul
		@soul = Soul.find(params[:soul_id])
	end

	def find_quotation
		@quotation = Quotation.find(params[:id])
		#@soul = Soul.find(params[:soul_id])
		#@quotation = @soul.quotations.find(params[:id])
		#@quotation = quotation.find_by(soul_id: params[:quotation_id])
		#@quotation = @soul.quotations.where(id: params[:id])
		#@message.comments.where(id: params[:id])
	end
end
