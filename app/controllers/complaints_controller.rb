class ComplaintsController < ApplicationController
	before_action :authenticate_nagger!, except: [:index, :show]

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
		complaint.nagger = current_nagger
		if complaint.save
			redirect_to complaint, notice: 'Thank you for your complaint'
		else
			render action: 'new'
		end
	end

	def loveit
    unless complaint.nagger == current_nagger
    	love = complaint.loves.build(nagger: current_nagger)
      if love.save
        redirect_to complaints_path
        flash[:notice] = "You love it!"
      else
      	redirect_to complaints_path, notice: "Error"
      end
    else
    	redirect_to complaints_path, notice:  "You can't love yourself!"
    
    end
  end

	private

	def complaint_params
		params.require(:complaint).permit(:name, :content, :url)
	end
end
