require 'pry'

class ComplaintsController < ApplicationController
	before_action :authenticate_nagger!, except: [:index, :show]
  before_action :check_date_create, only: [:create]
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
        redirect_to complaints_path, alert: "You've already loved it!"
      end
    else
      redirect_to complaints_path, notice:  "You can't love yourself!"

    end
  end

    def edit
    end

    def update
      if current_nagger != complaint.nagger
        redirect_to complaints_path
        flash[:alert] = 'You\'re not allowed to update this complaint'
      else
        if self.complaint.update(complaint_params)
          redirect_to complaint_path
          flash[:notice] = 'The complaint has been updated!'
        end
      end
    end

    def destroy
      if current_nagger != complaint.nagger
        redirect_to complaints_path
        flash[:alert] = 'You\'re not allowed to delete this complaint'
      else
        complaint.destroy
        redirect_to complaints_path
        flash[:notice] = 'The complaint has been deleted!'
      end
    end

  private

  def complaint_params
    params.require(:complaint).permit(:name, :content, :url)
  end

  def check_date_create
    if Complaint.where('nagger_id = ?', current_nagger.id).where('created_at >= ?', Date.today).count > 3
      redirect_to complaints_path
      flash[:alert] = 'Too many complaints, today!'
    end
  end
end
