class CensorshipsController < ApplicationController
  expose(:censorships)
  expose(:censorship)

  def index
  end

  def new
  end

  def edit
  end

  def create
    self.censorship = Censorship.new(censorship_params)
    if censorship.save
      redirect_to censorships_path, notice: 'The word has been added!'
    else
      render action: 'index'
    end
  end

  def update
    if self.censorship.update(censorship_params)
      redirect_to censorships_path
      flash[:notice] = 'The word has been updated!'
    end
  end

  def destroy
    censorship.destroy
    redirect_to censorships_path
    flash[:notice] = 'The word has been deleted!'
  end

  private

  def censorship_params
    params.require(:censorship).permit(:word)
  end
end
