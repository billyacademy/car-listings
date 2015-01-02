class ManufacturersController < ApplicationController
  def index
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturer_path(@manufacturer)
      flash[:notice] = "Manufacturer successfully created."
    else
      render :manufacturer
    end
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
