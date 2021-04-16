class GasPricesController < ApplicationController
  before_action :set_gas_price, only: [:show, :update, :destroy]

  # GET /gas_prices
  def index
    @gas_prices = GasPrice.all

    render json: @gas_prices
  end

  # GET /gas_prices/1
  def show
    render json: @gas_price
  end

  # POST /gas_prices
  def create
    @gas_price = GasPrice.new(gas_price_params)

    if @gas_price.save
      render json: @gas_price, status: :created, location: @gas_price
    else
      render json: @gas_price.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gas_prices/1
  def update
    if @gas_price.update(gas_price_params)
      render json: @gas_price
    else
      render json: @gas_price.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gas_prices/1
  def destroy
    @gas_price.destroy
  end

  def search 
    @gas = find_price()
    @price = Hash['gas_price' => @gas]
    @gas_price = GasPrice.new(@gas = Hash.new)

    if @gas_price.save
      render json: @gas_price, status: :created, location: @gas_price
    else
      render json: @gas_price.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_gas_price
    #   @gas_price = GasPrice.find(params[:id])
    # end

    def request_api()
      response = Excon.get(
        Rails.application.credentials.api[:gas_api]     
)

      return nil if response.status != 200
    data = JSON.parse(response.body)
    data['gasPriceRange']['4']
    end

    def find_price()
      request_api()
    end

    # Only allow a trusted parameter "white list" through.
    def gas_price_params
      params.require(:gas_price).permit(:gas_price)
    end
end
