class LoveController < ApplicationController

  expose(:love)
  expose(:loves)

  def love

    Love.user = current_user
    if Love.save
      redirect_to complaint
      flash[:notice] = "You love it!"
  end
end
