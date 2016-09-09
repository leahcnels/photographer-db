class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end
  def new
    @photographer = Photographer.find(params[:photographer_id])
    @image = @photographer.images.new
  end
  def create
    @photographer = Photographer.find(params[:photographer_id])
    @image = @photographer.images.new(image_params)
    if @image.save
      redirect_to photographer_path(@photographer)
    else
      render :new
    end
  end

private
  def image_params
    params.require(:image).permit(:img_file)
  end
end
