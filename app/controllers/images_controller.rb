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
      flash[:success] = "Image uploaded!"
      redirect_to photographer_path(@photographer)
    else
      flash[:alert] = "Upload unsuccessful, please try again!"
      render :new
    end
  end
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:error] = "Image deleted!"
    redirect_to photographer_path(@image.photographer)
  end
private
  def image_params
    params.require(:image).permit(:img_file)
  end
end
