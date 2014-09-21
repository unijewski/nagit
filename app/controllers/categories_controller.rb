class CategoriesController < ApplicationController
  before_action :authenticate_nagger!, only: [:new, :edit, :update, :destroy, :create]
  
  expose(:categories)
  expose(:category, attributes: :category_params)
  expose(:complaints)


  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if category.destroy
      redirect_to categories, notice: 'Category was successfully destroyed.'
    else
      redirect_to categories, alert: 'Category wasnt destroyed.'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
