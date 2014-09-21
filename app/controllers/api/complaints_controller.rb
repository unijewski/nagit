class Api::ComplaintsController < ApplicationController
	expose(:complaints)
	expose(:complaint, attributes: :complaint_params)

	def index
		render json: complaints
	end

	def new
		
	end

	def show
		render json: complaint
	end

	def create
		#self.complaint = Complaint.new
		binding.pry

		#complaint.nagger_id = complaint.nagger_id
		if complaint.save
			render nothing: true, status: 201
		else
			render json: complaint.errors.to_json, status: 422
		end
	end

	def complaint_params
    	params.require(:complaint).permit(:name, :content, :nagger_id)
  	end

end
