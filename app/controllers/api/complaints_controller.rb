class Api::ComplaintsController < ApplicationController
	expose(:complaints)
	expose(:complaint)

	def index
		render json: complaints
	end

	def show
		render json: complaint
	end

end
