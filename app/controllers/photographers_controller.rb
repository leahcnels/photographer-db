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
      flash[:success] = "Photographer added!"
      redirect_to photographers_path
    else
      flash[:alert] = "Save unsuccessful, please try again!"
      render :new
    end
  end
  def edit
    @photographer = Photographer.find(params[:id])
  end
  def update
    @photographer = Photographer.find(params[:id])
    if @photographer.update(photographer_params)
      flash[:success] = "Photographer updated!"
      redirect_to photographer_path(@photographer)
    else
      flash[:alert] = "Save unsuccessful, please try again!"
      render :edit
    end
  end
  def destroy
    @photographer = Photographer.find(params[:id])
    @photographer.destroy
    flash[:error] = "Photographer deleted!"
    redirect_to photographers_path
  end

private
  def photographer_params
    params.require(:photographer).permit(:name, :address, :phone, :email, category_ids:[])
  end
end
