class CarsController < ApplicationController
    def index
      @cars = Car.all
    end

    def new
      @car = Car.new
      @manufacturers = Manufacturer.all.collect { |manufacturer| [manufacturer.name, manufacturer.id]}
    end

    def create
      @cars = Car.all
      @car = Car.new(car_params)
      @manufacturers = Manufacturer.all.collect { |manufacturer| [manufacturer.name, manufacturer.id]}
      car_manufacturer = Manufacturer.find(params[:car]["manufacturer_id"])
      @car.manufacturer_id = car_manufacturer.id

      if @car.save
        redirect_to cars_path
        flash[:notice] = "Car successfully created."
      else
        render :new
      end
    end

    private

    def car_params
      params.require(:car).permit(:color, :year, :description, :mileage, :manufacturer_id)
    end
end
