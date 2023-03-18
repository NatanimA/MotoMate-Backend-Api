class Api::V1::MotorcyclesController < ApplicationController
  before_action :set_motorcycle, only: %i[show update destroy]

  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles.to_json(methods: :image_url)
  end

  def show
    render json: @motorcycle.to_json(methods: :image_url)
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)

    if params[:image]
      @motorcycle.image.attach(params[:image])
    end

    if @motorcycle.save
      render json: @motorcycle.to_json(methods: :image_url), status: :created, location: api_v1_motorcycle_url(@motorcycle)
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  end

  def update
    if params[:image]
      @motorcycle.image.attach(params[:image])
    end

    if @motorcycle.update(motorcycle_params)
      render json: @motorcycle.to_json(methods: :image_url)
    else
      render json: @motorcycle.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    if @motorcycle.nil?
      render json: { error: 'Motorcycle not found' }, status: :not_found
    else
      @motorcycle.reservations.destroy_all
      @motorcycle.destroy
      head :no_content
    end
  end

  private

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Motorcycle not found' }, status: :not_found
  end

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :price, :description, :model_year, :engine, :fuel_type)
  end
end
