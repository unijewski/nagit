class CensorshipsController < ApplicationController
  expose(:censorships)
  expose(:censorship, attributes: :censorship_params)

  def index
  end

  def new
  end

  def edit
  end

  def create
    if censorship.save
      redirect_to censorships_path, notice: 'The word has been added!'
    else
      render action: 'index'
    end
  end

  def update
    if censorship.update(censorship_params)
      redirect_to censorships_path, notice: 'The word has been updated!'
    end
  end

  def destroy
    if censorship.destroy
      redirect_to censorships_path , notice: 'The word has been deleted!'
    else
      redirect_to censorships_path, alert: 'The word wasnt destroyed'
    end
  end

  private

  def censorship_params
    params.require(:censorship).permit(:word)
  end
end
