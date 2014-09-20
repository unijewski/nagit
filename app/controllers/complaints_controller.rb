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

		if complaint.save
			redirect_to complaint, notice: 'Thank you for your complaint'
		else
			render action: 'new'
		end
	end

	def love
    unless @complaint.user == current_user
      Love.user = current_user
      if Love.save
        redirect_to complaint_path(complaint)
        flash[:notice] = "You love it!"
      else
      	redirect_to complaint_path(complaint)
      end
    else
      flash[:error] = "You can't love yourself!"
    end
  end

  	def edit  		
  	end

  	def update
  		if current_nagger != complaint.nagger
  			redirect_to complaints_path, notice: 'You\'re not allowed to delete this complaint'
  		else
  			if self.complaint.update(complaint_params)
  				redirect_to complaint_path
  			end
  		end   		
  	end

  	def delete
  		if current_nagger != complaint.nagger
  			redirect_to complaints_path, notice: 'You\'re not allowed to delete this complaint'
  		else
  			complaint.destroy
  			redirect_to complaints_path
  		end  			
  	end

	private

	def complaint_params
		params.require(:complaint).permit(:name, :content, :url)
	end
end
