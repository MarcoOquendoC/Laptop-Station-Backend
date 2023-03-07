class ReservesController < ApplicationController
  before_action :set_reserf, only: %i[ show update destroy ]

  # GET /reserves
  def index
    @reserves = Reserve.all

    render json: @reserves
  end

  # GET /reserves/1
  def show
    render json: @reserf
  end

  # POST /reserves
  def create
    @reserf = Reserve.new(reserf_params)

    if @reserf.save
      render json: @reserf, status: :created, location: @reserf
    else
      render json: @reserf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reserves/1
  def update
    if @reserf.update(reserf_params)
      render json: @reserf
    else
      render json: @reserf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reserves/1
  def destroy
    @reserf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserf
      @reserf = Reserve.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserf_params
      params.require(:reserf).permit(:date, :user_id_id, :item_id_id)
    end
end
