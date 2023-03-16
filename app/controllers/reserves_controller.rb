class ReservesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reserf, only: %i[show update destroy]

  # GET /reserves
  def index
    @reserves = Reserve.all.select { |r| r.user_id == current_user.id }
    @items = Item.all
    @reserves1 = @reserves.map do |r|
      {
        name: "#{current_user.first_name} #{current_user.last_name}",
        title: @items.select { |i| i.id == r.item_id }[0].title,
        id: r.id,
        date: r.date,
        user_id: r.user_id,
        item_id: r.item_id,
        created_at: r.created_at,
        updated_at: r.updated_at
      }
    end
    render json: @reserves1
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
    @reserves2 = reservations_list
    render json: @reserves2
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
    @reserves = Reserve.all.select { |r| r.user_id == current_user.id }
    @items = Item.all
    @reserves1 = @reserves.map do |r|
      {
        name: "#{current_user.first_name} #{current_user.last_name}",
        title: @items.select { |i| i.id == r.item_id }[0].title,
        id: r.id,
        date: r.date,
        user_id: r.user_id,
        item_id: r.item_id,
        created_at: r.created_at,
        updated_at: r.updated_at
      }
    end
    render json: @reserves1
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reserf
    @reserf = Reserve.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reserf_params
    params.require(:reserf).permit(:date, :user_id, :item_id)
  end

  def reservations_list
    @reserves = Reserve.all.select { |r| r.user_id == current_user.id }
    @items = Item.all
    @reserves1 = @reserves.map do |r|
      {
        name: "#{current_user.first_name} #{current_user.last_name}",
        title: @items.select { |i| i.id == r.item_id }[0].title,
        id: r.id,
        date: r.date,
        user_id: r.user_id,
        item_id: r.item_id,
        created_at: r.created_at,
        updated_at: r.updated_at
      }
      end
    @reserves1
  end
end
