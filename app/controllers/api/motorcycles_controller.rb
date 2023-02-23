class Api::MotorcyclesController < ApplicationController
  before_action :set_motorcycle, only: %i[show update destroy]

  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles
  end

  def show
    render json: @motorcycle
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)

    if @motorcycle.save
      render json: @motorcycle, status: :created, location: @motorcycle
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  end

  def update
    if @motorcycle.update(motorcycle_params)
      render json: @motorcycle
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @motorcycle.destroy
    head :no_content
  end

  private

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :img_url, :price, :description, :model_year, :engine, :fuel_type)
  end
end
