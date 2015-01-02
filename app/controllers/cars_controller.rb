class CarsController < ApplicationController
    def index
    end

    def new
      @car = Car.new
    end

    def create
      @cars = Car.all
      @car = Car.new(car_params)
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
