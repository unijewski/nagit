class ComplaintsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]


	expose(:complaints)
	expose(:complaint)

	expose(:love)

	def index
	end

	def new
	end

	def show
	end

	def create
		self.complaint = Complaint.new(complaint_params)

		if complaint.save
			redirect_to complaint, notice: 'Thank you for your complaint'
		else
			render action: 'new'
		end
	end

	

	private

	def complaint_params
		params.require(:complaint).permit(:name, :content, :url)
	end
end
