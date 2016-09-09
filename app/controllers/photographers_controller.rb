class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.all
  end
  def show
    @photographer = Photographer.find(params[:id])
  end
  def new
    @photographer = Photographer.new
  end
  def create
    @photographer = Photographer.new(photographer_params)
    if @photographer.save
      redirect_to photographers_path
    else
      render :new
    end
  end

private
  def photographer_params
    params.require(:photographer).permit(:name, :address, :phone, :email, category_ids:[])
  end
end
