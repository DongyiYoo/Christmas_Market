class MarketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_market, only: %i[ show update destroy ]

  # GET /markets
  def index
    @markets = Market.all
    render json: @markets
  end

  # GET /markets/1
  def show
    render json: @market
  end

  # POST /markets
  def create
    @market = Market.new(market_params)

    if @market.save
      render json: @market, status: :created
    else
      render json: @market.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /markets/1
  def update
    if @market.update(market_params)
      render json: @market
    else
      render json: @market.errors, status: :unprocessable_entity
    end
  end

  # DELETE /markets/1
  def destroy
    @market.destroy!
    head :no_content
  end

  def calculate_discount
    result = Discount.calculate(params[:cart_items])
    render json: result
  end

  private
    def set_market
      @market = Market.find(params[:id])
    end

    def market_params
      params.require(:market).permit(:name, :description, :price, :stock, :image_url)
    end
end
